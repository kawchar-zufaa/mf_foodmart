import 'package:flutter/material.dart';
import 'package:mf_foodmart/controller/cart_controller.dart';
import 'package:mf_foodmart/models/cart_model.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CardRemoveBtn extends StatelessWidget {
  const CardRemoveBtn({
    super.key,
    required CartController cartController,
    required this.cartModel,
  }) : _cartController = cartController;

  final CartController _cartController;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ()async {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: TextWidget(text: 'remove!!',color: Colors.red,),
            content: const Text(
                'Are you sure you want to remove this item from your cart?'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  await _cartController
                      .deleteCartItem(
                     cartModel.productId)
                      .then((value) =>
                      Navigator.pop(context, 'OK'));
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      icon: const Icon(
        Icons.close,
        color: Colors.grey,
        size: 20,
      ),
    );
  }
}