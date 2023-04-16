import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/favourite_controller.dart';
import 'package:mf_foodmart/controller/product_controller.dart';
import 'package:mf_foodmart/screens/details/favourite_details.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class FavouriteScreen extends StatelessWidget {
   FavouriteScreen({Key? key}) : super(key: key);
  final _productController = Get.put(ProductController());
  final _favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() {
      if (_favouriteController.isLoading.value &&
          _favouriteController.favoriteList.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_favouriteController.favoriteList.isEmpty &&
          !_favouriteController.isLoading.value) {
        return Center(
          child: TextWidget(
            text: "No found product",
          ),
        );
      } else {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _favouriteController.favoriteList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final data = _favouriteController.favoriteList[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: MyAppColor.productBG,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    top: 15,
                    child: Container(
                      height: 130,
                      width: 130,
                      child: BuildImage(
                        size: size,
                          imgUrl: data.productImage.first['src'],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 6,
                    top: -2,
                    child: IconButton(
                      onPressed: () {
                          _favouriteController.removeItem(index);
                      },
                      icon: const Icon(Icons.close)


                    ),
                  ),

                  Positioned(
                    bottom: 50,
                    left: 10,
                    child: Container(
                        width: size.width / 3,
                        child: TextWidget(
                          text: data.productName,
                          maxLines: 2,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavouriteDetails(
                              pId: data.productId,
                              images: data.productImage,
                              cid: data.cid,
                              catName: data.categoryName,
                              pName: data.productName,
                              price: data.productPrice,
                              description: data.description.toString(),
                              shortDescription: data.shortDescription.toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: MyAppColor.btnColor,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 10,
                      child: TextWidget(
                        text: "CAD ${data.productPrice}",
                        color: MyAppColor.btnColor,
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
            );
          },
        );
      }
    });
  }


}
