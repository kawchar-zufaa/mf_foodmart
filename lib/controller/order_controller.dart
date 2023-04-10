

import 'package:get/get.dart';
import 'package:mf_foodmart/database_helper/order_database/order_database.dart';
import 'package:mf_foodmart/models/order_model.dart';

class OrderController extends GetxController {
  var orders = <OrderModel>[].obs;
  String total = '';

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  Future<void> getOrders() async {
    final List<OrderModel> result = await OrderDatabase.instance.getOrders();
    orders.value = result;
  }

  Future<void> deleteAllOrders() async {
    await OrderDatabase.instance.deleteAllOrders();
    orders.clear();
  }
}
