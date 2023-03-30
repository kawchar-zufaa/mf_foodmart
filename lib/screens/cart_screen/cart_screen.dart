import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/cart_controller.dart';
import 'package:mf_foodmart/screens/cart_screen/component/cart_item_widget.dart';
import 'package:mf_foodmart/screens/cart_screen/component/promo_code_field.dart';
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
              
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Subtotal:'),
                      Text('123'),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Shipping:'),
                      Text('123'),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Discount:'),
                      Text('123'),
                    ],
                  ),
                    const Text('----------------------------------------------------------------',style: TextStyle(
                      letterSpacing: 2
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Total:'),
                      Text('123'),
                    ],
                  ),
                ],
              ),
            
              const SizedBox(height: 10,),
            ],
          ),
        );
      }
    }));
  }
}
