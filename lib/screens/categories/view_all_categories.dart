import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/categories_controller.dart';
import 'package:mf_foodmart/widgets/search_field.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class ViewAllCategories extends StatelessWidget {
  final  _categoryController = Get.put(CategoriesController());

  ViewAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.bgColor,
      appBar: AppBar(
          iconTheme: const IconThemeData(
              color: MyAppColor.textColor
          ),
          backgroundColor: MyAppColor.bgColor,
          elevation: 0,
          centerTitle: true,
          title: TextWidget(text: "Categories",color: MyAppColor.textColor,size: 20,),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchField(),
            ),
          )
      ),



      body: _categoryController.buildProductList(size)




    );
  }
}