import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/order_controller.dart';
import 'package:mf_foodmart/screens/order_screen/components/order_remove_btn.dart';
import 'package:mf_foodmart/screens/order_screen/components/order_items.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class OrderScreen extends StatelessWidget {
  final OrderController controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        backgroundColor: MyAppColor.productBG,
        title: TextWidget(text: "Orders",size: 20,),
        centerTitle: true,
        actions: [
          OrderRemoveBtn(controller: controller)
        ],
      ),
      body: Obx(() {
        if (controller.orders.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: controller.orders.length,
            itemBuilder: (BuildContext context, int index) {
              final order = controller.orders[index];
              return OrderItems(order: order);
            },
          );
        } else if (controller.orders.isEmpty) {
          return Center(
            child: TextWidget(
              text: "No Order Found",
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}


