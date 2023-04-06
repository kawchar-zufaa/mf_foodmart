import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/api_handler/api_Service.dart';
import 'package:mf_foodmart/models/categories_model.dart';
import 'package:mf_foodmart/screens/categories/categories_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CategoriesController extends GetxController{

  var categoriesList=<CategoriesModel>[].obs;

  var isLoading=false.obs;

  @override
  void onInit() {
   fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories()async{
    try{
      isLoading.value=true;
      var data=await ApiService.fetchCategory();
      if(data!=null){
        categoriesList.addAll(data);
      }
    }catch(e){
      print(e.toString());
      throw Exception('Something went wrong $e');
    }finally{
      isLoading.value=false;
    }



  }



  Widget buildProductList(Size size) {
    return Obx(() {
      if (categoriesList.isEmpty && isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (categoriesList.isEmpty && !isLoading.value) {
        return const Center(child: Text('No products found.'));
      } else {
        return GridView.builder(
          itemCount: categoriesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 160,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final data =categoriesList[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoriesScreen(
                          cid: data.id!.toInt(),
                          name: data.name.toString(),
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: MyAppColor.productBG,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: BuildImage(
                        size: size,
                        imgUrl:data.image?.src.toString() ?? "",
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                        width: size.width/3,
                        child: TextWidget(text: data.name.toString(),maxLines: 2,)),
                  ],
                ),
              ),
            );
          },
        );


      }
    });
  }

}