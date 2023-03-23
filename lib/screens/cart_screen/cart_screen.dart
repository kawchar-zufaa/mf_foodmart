import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/cart_controller.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);


  final _cartController=Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    _cartController.getCartData();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:Obx((){
        if(_cartController.isLoading.value){
          return const Center(child: CircularProgressIndicator(),);
        }else if(_cartController.cartList.isEmpty){
          return Center(child: TextWidget(text: "Your cart is empty!",),);
        }else{
          return ListView(
            children: [
              Column(
                  children:List.generate(_cartController.cartList.length, (index){
                    final data=_cartController.cartList[index];
                    return Card(
                      child: Container(
                        child: ListTile(
                          leading: Image.network(data.productImage),
                          title: TextWidget(text: data.productName,),
                        ),
                      ),
                    );

                  })
              ),


            ],
          );

        }

      })


    );
  }
}
