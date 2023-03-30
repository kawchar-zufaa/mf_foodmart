import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/categories_controller.dart';
import 'package:mf_foodmart/screens/categories/categories_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';

class HomeCategories extends StatelessWidget {
  final _categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() {
      if (_categoriesController.isLoading.value) {
        return Center(
          child: Container(),
        );
      } else if (_categoriesController.categoriesList.isEmpty) {
        return const Center(
          child: Text("No found product"),
        );
      } else {
        return Row(
          children: List.generate(_categoriesController.categoriesList.length,
              (index) {
            final data = _categoriesController.categoriesList[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 0,
                shadowColor: Colors.grey,
                color: MyAppColor.productBG,
                child: Column(
                  children: [
                    InkWell(
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
                          padding: const EdgeInsets.all(3),
                          height: 70,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // border: Border.all(
                            //   color: const Color(
                            //     0xffEAEBEC,
                            //   ),
                            // ),
                          ),
                          child: BuildImage(
                            size: size,
                            imgUrl: data.image?.src.toString() ?? "",
                          )),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 70,
                        child: Center(
                            child: Text(
                          data.name.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        )))
                  ],
                ),
              ),
            );
          }),
        );
      }
    });
  }
}
