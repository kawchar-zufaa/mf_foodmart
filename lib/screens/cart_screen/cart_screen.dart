import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/cart_controller.dart';
import 'package:mf_foodmart/screens/cart_screen/component/cart_item_widget.dart';
import 'package:mf_foodmart/screens/cart_screen/component/promo_code_field.dart';
import 'package:mf_foodmart/screens/cart_screen/component/total_calculation.dart';
import 'package:mf_foodmart/screens/check_out/checkout_screen.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CartScreen extends StatelessWidget {

  final _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    _cartController.getCartData();
    final size = MediaQuery.of(context).size;
    return Scaffold(body: Obx(() {
      if (_cartController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_cartController.cartList.isEmpty) {
        return Center(
          child: TextWidget(
            text: "Your cart is empty!",
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              /// Cart Item  ..................................................#
              Expanded(
                child: ListView(
                  children: [
                    Column(
                        children: List.generate(_cartController.cartList.length,
                            (index) {
                      final data = _cartController.cartList[index];
                      return CartItemWidget(cartModel: data);
                    })),
                  ],
                ),
              ),

              /// Promo code field............................................#
              const PromoCodeField(),
              const SizedBox(height: 20),

              /// Total Calculation ............................................#
              TotalCalculation(),
              const SizedBox(height: 10,),

              /// Continue to Checkout Button....................................#
              CustomButton(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutScreen(
                  cartItem: _cartController.cartList,
                  totalAmount: _cartController.getTotalPrice()+_cartController.shippingCharge.value+_cartController.discount.value,

                )));
              }, text: 'Continue to Checkout')
            ],
          ),
        );
      }
    }));
  }
}
// double totalAmount = 34.45000000;
// String formattedAmount = String.format("%.2f", totalAmount);
// System.out.println(formattedAmount); //
