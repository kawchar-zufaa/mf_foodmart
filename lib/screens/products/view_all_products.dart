import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/product_controller.dart';
import 'package:mf_foodmart/screens/home/components/search_field.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class ViewAllProduct extends StatelessWidget {
  final  _productController = Get.put(ProductController());

  ViewAllProduct({super.key});

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
          title: TextWidget(text: "Products",color: MyAppColor.textColor,size: 20,),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchField(),
            ),
          )
      ),



      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _productController.loadMore();
          }
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: _productController.buildProductList(size)),
              Obx(() {
                if (_productController.isLoading.value) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}