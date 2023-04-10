
import 'package:flutter/material.dart';
import 'package:mf_foodmart/models/order_model.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    super.key,
    required this.order,
  });
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildImage(size: size/10, imgUrl: order.productImage),
          const SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: order.productName,fontWeight: FontWeight.bold,),
                TextWidget(text: "Qty:${order.productQuantity}",color: Colors.grey,size: 14,),
                TextWidget(text: 'Date: ${order.date}',color: Colors.grey,size: 14,)
              ],
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Row(
              children: [
                TextWidget(text: 'CAD ${order.productPrice}',color: MyAppColor.btnColor,fontWeight: FontWeight.bold,),
                TextWidget(text: '/per lbs',color: Colors.grey,size: 12,),
              ],
            ),
          )
        ],
      ),
    );
  }
}