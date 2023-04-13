import 'package:get/get.dart';
import 'package:mf_foodmart/database_helper/cart_database/cart_database.dart';
import 'package:mf_foodmart/models/cart_model.dart';

class CartController extends GetxController {
  var cartList = <CartModel>[].obs;
  var isLoading = false.obs;
  var discount=0.0.obs;
  var shippingCharge=0.0.obs;
  @override
  void onInit() {
    getCartData();
    super.onInit();
  }

  Future<void> getCartData() async {
    try {
      final item = await CartDatabase.instance.getCartItems();

      if (item != null) {
        cartList.value = item;

      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateCartItem(CartModel cartItem) async {
    await CartDatabase.instance.updateCartItem(cartItem);
    getCartData();
  }

  getTotalPrice() {
    double total = 0.0;
    cartList.forEach((element) {
      double price = double.parse(element.productPrice);
      total += price * element.count;
    });
    getCartData();
    return total;
  }

  Future<void> deleteAllCartItems()async{
    await CartDatabase.instance.deleteAllCartItems();
    cartList.clear();
  }

  Future<void> deleteCartItem(int productId) async {
    await CartDatabase.instance.deleteCartItem(productId);
    getCartData();
  }
}
