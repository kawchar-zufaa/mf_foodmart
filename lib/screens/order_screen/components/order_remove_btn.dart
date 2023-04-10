import 'package:flutter/material.dart';
import 'package:mf_foodmart/controller/order_controller.dart';
import 'package:mf_foodmart/screens/main/main_screen.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class OrderRemoveBtn extends StatelessWidget {
  const OrderRemoveBtn({
    super.key,
    required this.controller,
  });

  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          controller.orders.isEmpty
              ? showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text(
                        'Buy the food you need'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
                        },
                        child: const Text('Shop now!'),
                      ),
                    ],
                  ),
                )
              : showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: TextWidget(
                      text: 'Delete!!',
                      color: Colors.red,
                    ),
                    content: const Text(
                        'Are you sure you want to remove your Order items?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await controller
                              .deleteAllOrders()
                              .then((value) => Navigator.pop(context, 'OK'));
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
        },
        icon: const Icon(Icons.close));
  }
}
