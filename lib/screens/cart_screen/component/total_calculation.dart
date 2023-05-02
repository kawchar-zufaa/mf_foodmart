import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/cart_controller.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class TotalCalculation extends StatelessWidget {

  final _cartController=Get.put(CartController());
   TotalCalculation({Key? key}) : super(key: key);


  // double shippingCharge=0.0;
  // double discount=0.0;
  // double total=0.0;
  // totalPrice(){
  //   total=_cartController.getTotalPrice()+shippingCharge+discount;
  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Subtotal:'),
            //Text('CAD ${_cartController.getTotalPrice()}'),
            Text('CAD ${_cartController.getTotalPrice().toStringAsFixed(2)}'),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Shipping:'),
            Text('CAD ${_cartController.shippingCharge.value.toStringAsFixed(2)}'),
            // Text('CAD ${_cartController.shippingCharge.value}'),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Discount:'),
            Text('CAD ${_cartController.discount.value.toStringAsFixed(2)}'),
            //Text('CAD ${_cartController.discount.value}'),
          ],
        ),
        const Text('----------------------------------------------------------------',style: TextStyle(
            letterSpacing: 2
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(text: 'Total :',size: 20,fontWeight: FontWeight.bold,),
            TextWidget(text: 'CAD ${( _cartController.getTotalPrice()+_cartController.shippingCharge.value+_cartController.discount.value).toStringAsFixed(2)}',size: 20,fontWeight: FontWeight.bold,)
            //TextWidget(text: 'CAD ${_cartController.getTotalPrice()+_cartController.shippingCharge.value+_cartController.discount.value}',size: 20,fontWeight: FontWeight.bold,)
          ],
        ),
      ],
    );
  }
}
