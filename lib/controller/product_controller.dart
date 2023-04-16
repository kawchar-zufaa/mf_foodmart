import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/api_handler/api_Service.dart';
import 'package:mf_foodmart/controller/favourite_controller.dart';
import 'package:mf_foodmart/models/product_model.dart';
import 'package:mf_foodmart/screens/details/details_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class ProductController extends GetxController{

  var productList=<ProductModel>[].obs;
  var isLoading=false.obs;
  var page=1;
  var perPage=16;

  @override
  void onInit() {
   getProduct();
    super.onInit();
  }

  Future<void> getProduct()async{
    try{
      isLoading(true);
      final data=await ApiService.fetchProduct(page: page,perPage: perPage);
       if(data!=null){

         productList.addAll(data);
         page++;
       }

    }catch(e){
      print(e.toString());
      log(e.toString());
    }finally{

      isLoading(false);
    }

  }
   void loadMore(){
    if(!isLoading.value){
      getProduct();
    }
   }


  // Widget buildProductList(Size size) {
  //   return Obx(() {
  //     if (productList.isEmpty && isLoading.value) {
  //       return const Center(child: CircularProgressIndicator());
  //     } else if (productList.isEmpty && !isLoading.value) {
  //       return const Center(child: Text('No products found.'));
  //     } else {
  //       return GridView.builder(
  //         itemCount: productList.length,
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           mainAxisExtent: 220,
  //           crossAxisSpacing: 10,
  //           mainAxisSpacing: 10,
  //         ),
  //         itemBuilder: (context, index) {
  //           final data =productList[index];
  //           bool isFavorite=false;
  //
  //           return Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(16),
  //               color: MyAppColor.productBG,
  //             ),
  //             child: Stack(
  //               children: [
  //                 Positioned(
  //                   left: 30,
  //                   top: 15,
  //                   child: Container(
  //                     height: 130,
  //                     width: 130,
  //                     child: BuildImage(
  //                       size: size,
  //                       imgUrl: data.images.first.src ?? "",
  //                     ),
  //                   ),
  //                 ),
  //                 IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(
  //                     Icons.favorite_border_outlined,
  //                     color: Color(0xffF53D3D),
  //                     size: 30,
  //                   ),
  //                 ),
  //                 Positioned(
  //                   bottom: 50,
  //                   left: 10,
  //                   child: Container(
  //                       width: size.width/3,
  //                       child: TextWidget(text: data.name,maxLines: 2,)),
  //
  //                 ),
  //                 Positioned(
  //                   bottom: 0,
  //                   right: 0,
  //                   child: InkWell(
  //                     onTap: (){
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => DetailsScreen(
  //                             pId: data.id,
  //                             images: data.images,
  //                             cid: data.categories.first.id,
  //                             catName: data.categories[0].name,
  //                             pName: data.name,
  //                             price: data.price,
  //                             description: data.description.toString(),
  //                             shortDescription:
  //                             data.shortDescription.toString(),
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                     child: Container(
  //                       height: 45,
  //                       width: 45,
  //                       decoration: const BoxDecoration(
  //                         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
  //                         color: MyAppColor.btnColor,
  //                       ),
  //                       child: const Icon(Icons.add,color: Colors.white,),
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                     bottom: 20,
  //                     left: 10,
  //                     child: TextWidget(text: "CAD ${data.price}",color: MyAppColor.btnColor,size: 14,fontWeight: FontWeight.w600,))
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //
  //
  //     }
  //   });
  // }

}