import 'package:get/get.dart';
import 'package:mf_foodmart/database_helper/cart_database/cart_database.dart';
import 'package:mf_foodmart/models/cart_model.dart';

class CartController extends GetxController{

  var cartList=<CartModel>[].obs;
  var isLoading=false.obs;

  // @override
  // void onInit() {
  //  getCartData();
  //   super.onInit();
  // }

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
}