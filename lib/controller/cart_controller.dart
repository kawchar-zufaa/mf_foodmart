import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/database_helper/cart_database/cart_database.dart';
import 'package:mf_foodmart/models/cart_model.dart';

class CartController extends GetxController{

  var cartList=<CartModel>[].obs;
  var isLoading=false.obs;

  @override
  void onInit() {
   getCartData();
    super.onInit();
  }

   Future<void> getCartData()async{
    try
    {
      isLoading(true);
      final item=await CartDatabase.instance.getCartItems();

    if(item!=null){
      cartList.value=item;
    }}catch(e){

    }finally{
      isLoading(false);
    }

   }

  Future<void> updateCartItem(CartModel cartItem) async {
    await CartDatabase.instance.updateCartItem(cartItem);
   getCartData();
  }

  // Future<void> addCartItem(CartModel cartItem) async {
  //   await dbHelper.insertCartItem(cartItem);
  //   fetchCartItems();
  // }

  // Future<void> deleteCartItem(int id) async {
  //   await dbHelper.deleteCartItem(id);
  //   fetchCartItems();
  // }

}