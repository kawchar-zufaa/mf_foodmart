import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/address_controller.dart';
import 'package:mf_foodmart/controller/cart_controller.dart';
import 'package:mf_foodmart/database_helper/delivery_address_database/delivery_address_database.dart';
import 'package:mf_foodmart/models/address_model.dart';
import 'package:mf_foodmart/screens/check_out/checkout_screen.dart';
import 'package:mf_foodmart/screens/delivery_address/component/address_textfilled.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class AddressScreen extends StatefulWidget {
  AddressModel? addressModel;
  AddressScreen({Key? key, this.addressModel}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _addressController = Get.put(AddressController());
  final _cartController = Get.put(CartController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.addressModel != null) {
      firstNameController.text = widget.addressModel!.firstName;
      lastNameController.text = widget.addressModel!.lastName;
      companyController.text = widget.addressModel!.company;
      address1Controller.text = widget.addressModel!.address1;
      address2Controller.text = widget.addressModel!.address2;
      cityController.text = widget.addressModel!.city;
      stateController.text = widget.addressModel!.state;
      postcodeController.text = widget.addressModel!.postCode;
      countryController.text = widget.addressModel!.country;
      emailController.text = widget.addressModel!.email;
      phoneController.text = widget.addressModel!.phone;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: MyAppColor.productBG,
        elevation: 0,
        title: TextWidget(
          text: "Delivery Address",
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            AddressTextFilled(
              text: 'First Name',
              controller: firstNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter you first Name";
                }
                return null;
              },
            ),
            AddressTextFilled(
              text: 'Last Name',
              controller: lastNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your Last Name';
                }
                return null;
              },
            ),
            AddressTextFilled(
              text: 'Company(Optional)',
              controller: companyController,
            ),
            AddressTextFilled(
              text: 'Address1',
              controller: address1Controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your Address1';
                }
                return null;
              },
            ),
            AddressTextFilled(
              text: 'Address2',
              controller: address2Controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your Address2';
                }
                return null;
              },
            ),
            AddressTextFilled(
              text: 'City',
              controller: cityController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your City Name';
                }
                return null;
              },
            ),
            AddressTextFilled(
              text: 'State',
              controller: stateController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your State Name';
                }
                return null;
              },
            ),
            AddressTextFilled(
              textInputType: TextInputType.number,
              text: 'PostCode',
              controller: postcodeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your PostCode';
                }
                return null;
              },
            ),
            AddressTextFilled(
              text: 'Country/Region',
              controller: countryController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your Country Name';
                }
                return null;
              },
            ),
            AddressTextFilled(
              textInputType: TextInputType.emailAddress,
              text: 'Email',
              validator: validateEmail,
              controller: emailController,
            ),
            AddressTextFilled(
              textInputType: TextInputType.phone,
              text: 'Phone',
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your Phone number';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
          child: CustomButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                AddressModel addressModel = AddressModel(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  company: companyController.text,
                  address1: address1Controller.text,
                  address2: address2Controller.text,
                  city: cityController.text,
                  state: stateController.text,
                  postCode: postcodeController.text,
                  country: countryController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                );
                if (widget.addressModel == null) {
                  await DeliveryAddressDatabase.instance
                      .insertAddress(addressModel);
                  Fluttertoast.showToast(msg: 'Data insert Successfully');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CheckoutScreen(
                                cartItem: _cartController.cartList,
                                totalAmount: _cartController.getTotalPrice() +
                                    _cartController.shippingCharge.value +
                                    _cartController.discount.value,
                              )));
                } else {
                  addressModel.id = widget.addressModel!.id;
                  await DeliveryAddressDatabase.instance
                      .updateAddress(addressModel);
                  Fluttertoast.showToast(msg: 'Data Updated Successfully');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CheckoutScreen(
                                cartItem: _cartController.cartList,
                                totalAmount: _cartController.getTotalPrice() +
                                    _cartController.shippingCharge.value +
                                    _cartController.discount.value,
                              )));
                }
              }
            },
            text: widget.addressModel == null ? "Insert" : "Update",
          )),
    );
  }

  bool validateFields() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        address1Controller.text.isEmpty ||
        address2Controller.text.isEmpty ||
        cityController.text.isEmpty ||
        stateController.text.isEmpty ||
        postcodeController.text.isEmpty ||
        countryController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please fill all the fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email';
    }
    return null;
  }

  String? textValidation(String? value, {required String text}) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }
}
