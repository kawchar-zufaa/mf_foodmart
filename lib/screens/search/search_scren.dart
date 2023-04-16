import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/search_controller.dart';
import 'package:mf_foodmart/screens/details/details_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
 final _searchController=Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        backgroundColor: MyAppColor.productBG,
        iconTheme: const IconThemeData(
          color: Colors.grey
        ),
        elevation: 0,
        title: TextWidget(text: "Search Your favourite food",color: Colors.grey,),
      ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
         child: Column(
           children: [
         Container(
         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
          height: 45,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: const Color(0xffEAEBEC)
              )
          ),
          child: TextField(
            onChanged: (value) {
              _searchController.searchProducts(value);
            },
            decoration: const InputDecoration(
              hintText: 'Search Grocery',
              border: InputBorder.none,
              suffixIcon: Icon(Icons.search)
            ),
          )),

             Obx(() => Expanded(

               child:_searchController.isLoading.value
                   ? const Center(child: CircularProgressIndicator())
                   :ListView.builder(
                   padding: const EdgeInsets.only(top: 10
                   ),
                   itemCount: _searchController.products.length,
                   itemBuilder: (context,index){
                     final product = _searchController.products[index];
                     return ListTile(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                             pId: product.id,
                             images: product.images,
                             cid: product.categories.first.id,
                             catName: product.categories.first.name,
                             pName: product.name,
                             price: product.price,
                             description: product.description,
                             shortDescription: product.shortDescription,
                         )));
                       },
                       leading: BuildImage(size: size/12,imgUrl:product.images.isNotEmpty?product.images.first.src:"",),
                       title: TextWidget(text: product.name,),
                       subtitle: TextWidget(text: product.categories.first.name,color: Colors.grey,),

                     );
                   }),
             ))

           ],
         ),

       ),
    );
  }
}
