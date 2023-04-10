import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mf_foodmart/controller/address_controller.dart';
import 'package:mf_foodmart/controller/cart_controller.dart';
import 'package:mf_foodmart/database_helper/cart_database/cart_database.dart';
import 'package:mf_foodmart/database_helper/delivery_address_database/delivery_address_database.dart';
import 'package:mf_foodmart/database_helper/order_database/order_database.dart';
import 'package:mf_foodmart/models/address_model.dart';
import 'package:mf_foodmart/models/cart_model.dart';
import 'package:mf_foodmart/models/order_model.dart';
import 'package:mf_foodmart/screens/check_out/components/credit_card_items.dart';
import 'package:mf_foodmart/screens/check_out/components/delivery_address_card.dart';
import 'package:mf_foodmart/screens/check_out/order_successfull_screen.dart';
import 'package:mf_foodmart/utility/constants.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';
import 'package:http/http.dart' as http;

class CheckoutScreen extends StatefulWidget {
  List<CartModel>? cartItem;
  double? totalAmount;
  CheckoutScreen({
    Key? key,
    this.cartItem,
    this.totalAmount,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _cartController=Get.put(CartController());
  bool _isCreditCard = false;
  String text = "";
  List<AddressModel> _addresses = [];
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  /// here checkout function.................
  Future<void> createOrder() async {
    const String userName = "ck_389df1912d9d0be0541ee41dc1e3fcbfb367bbf9";
    const String userPass = "cs_643aea4269872c4005d4a106676bcd07e96af983";
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$userName:$userPass'))}';

    final List<Map<String, dynamic>> lineItems = widget.cartItem!
        .map(
          (item) => {
            'product_id': item.productId,
            'name': item.productName,
            'quantity': item.count,
          },
        )
        .toList();

    final Map<String, dynamic> billing = {
      'first_name': _addresses.first.firstName,
      'last_name': _addresses.first.lastName,
      'address_1': _addresses.first.address1,
      'city': _addresses.first.city,
      'state': _addresses.first.state,
      'postcode': _addresses.first.postCode,
      'country': _addresses.first.country,
      'email': _addresses.first.email,
      'phone': _addresses.first.phone,
    };

    final Map<String, dynamic> shipping = {
      'first_name': _addresses.first.firstName,
      'last_name': _addresses.first.lastName,
      'address_1': _addresses.first.address1,
      'city': _addresses.first.city,
      'state': _addresses.first.state,
      'postcode': _addresses.first.postCode,
      'country': _addresses.first.country,
    };

    final Map<String, dynamic> shippingLines = {
      'method_id': 'flat_rate',
      'method_title': 'Flat Rate',
      'total': '${widget.totalAmount}',
    };

    final Map<String, dynamic> orderData = {
      'status': _isCreditCard == false ? "pending" : "processing",
      'payment_method': _isCreditCard == false ? "cod" : "bacs",
      "payment_method_title":
          _isCreditCard == false ? "Cash on Delivery" : "Direct Bank Transfer",
      'set_paid': false,
      'billing': billing,
      'shipping': shipping,
      'line_items': lineItems,
      'shipping_lines': [shippingLines],
    };

    final response = await http.post(
      Uri.parse(MyConstants.createOrder),
      headers: <String, String>{
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(orderData),
    );
    if (response.statusCode == 201) {

      final List<Map<String, dynamic>> orderData = widget.cartItem!
          .map(
            (item) => {
              'productId': item.productId,
              'productImage': item.productImage,
              'productName':item.productName,
              'productPrice': item.productPrice,
              'productQuantity': item.count,
              'date':formattedDate
            },
          )
          .toList();
        final orderModel= orderData.map((lineData) =>OrderModel.fromMap(lineData)).toList();
          OrderDatabase.instance.insertOrders(orderModel);
         await _cartController.deleteAllCartItems();
      await Navigator.push(context,
          MaterialPageRoute(builder: (_) => const OrderSuccessFullScreen()));
    } else {
      Fluttertoast.showToast(msg: 'Order placed failed');
      print('Failed to create order: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  void _loadAddresses() async {
    final addresses = await DeliveryAddressDatabase.instance.getAddresses();
    setState(() {
      _addresses = addresses;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyAppColor.productBG,
        title: TextWidget(
          text: "Checkout",
          size: 18,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          /// Delivery Address Card-----------------------------------
          DeliveryAddressCard(addresses: _addresses),
          const SizedBox(height: 10),

          /// Payment Method Button-----------------------------------
          _paymentMethodButton(),

          /// Credit Card Items widget---------------------------------
          _isCreditCard ? const CreditCardItems() : Container(height: 300),

          /// Privacy Policy Text And button---------------------------------
          _privacyPolicyText(),

          /// Total Price and CheckOut button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Total:',
                    color: const Color(0xff8B8B8B),
                  ),
                  TextWidget(
                    text: 'CAD ${widget.totalAmount}',
                    color: MyAppColor.btnColor,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomButton(
                onTap: () {
                  if (_addresses.isEmpty) {
                    Fluttertoast.showToast(msg: "Add Delivery Address first!");
                  } else {
                    createOrder();
                  }
                },
                text: "CheckOut",
                isResponsive: true,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _privacyPolicyText() {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
              text: 'Your personal data will be used to process your order, '
                  'support your experience throughout this website, '
                  'and for other purposes described in our ',
              style: TextStyle(color: Color(0xff8B8B8B))),
          TextSpan(
            text: 'privacy policy',
            style: const TextStyle(
              color: MyAppColor.btnColor,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }

  Widget _paymentMethodButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 12),
          child: TextWidget(text: "Selected Payment Method"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.shade100,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isCreditCard = false;
                    });
                  },
                  child: Container(
                    height: 85,
                    width: 125,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _isCreditCard == false
                                ? MyAppColor.btnColor
                                : Colors.grey,
                            width: _isCreditCard == false ? 3 : 0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/cash_on.png',
                          width: 30,
                          height: 30,
                        ),
                        TextWidget(text: 'Cash on delivery')
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.shade100,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isCreditCard = true;
                    });
                  },
                  child: Container(
                    height: 85,
                    width: 125,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _isCreditCard
                                ? MyAppColor.btnColor
                                : Colors.grey,
                            width: _isCreditCard ? 3 : 0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/card.png',
                          width: 30,
                          height: 30,
                        ),
                        TextWidget(text: 'Credit Card')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
