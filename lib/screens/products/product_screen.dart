import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/favourite_controller.dart';
import 'package:mf_foodmart/controller/product_controller.dart';
import 'package:mf_foodmart/screens/details/details_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class ProductScreen extends StatelessWidget {
  final _productController = Get.put(ProductController());
  final _favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    _productController.getProduct();
    _favouriteController.getFavoriteDataFromLocal();
    final size = MediaQuery.of(context).size;
    return Obx(() {
      if (_productController.isLoading.value &&
          _productController.productList.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_productController.productList.isEmpty &&
          !_productController.isLoading.value) {
        return Center(
          child: TextWidget(
            text: "No found product",
          ),
        );
      } else {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _productController.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final data = _productController.productList[index];
            bool isFavorite = false;
            for (var element in _favouriteController.favoriteList) {
              if (element.productId == data.id) {
                isFavorite = true;
              }
            }
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
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              pId: data.id,
                              images: data.images,
                              cid: data.categories.first.id,
                              catName: data.categories[0].name,
                              pName: data.name,
                              price: data.price,
                              description: data.description.toString(),
                              shortDescription:
                              data.shortDescription.toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        child: BuildImage(
                          size: size,
                          imgUrl:data.images.isNotEmpty?data.images.first.src ?? "":"",
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      _favouriteController.savaFavoriteDataInLocal(data);
                    },
                    icon: isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 25,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                            size: 25,
                          ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 10,
                    child: Container(
                        width: size.width / 3,
                        child: TextWidget(
                          text: data.name,
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
                            builder: (context) => DetailsScreen(
                              pId: data.id,
                              images: data.images,
                              cid: data.categories.first.id,
                              catName: data.categories[0].name,
                              pName: data.name,
                              price: data.price,
                              description: data.description.toString(),
                              shortDescription:
                                  data.shortDescription.toString(),
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
                      text: "CAD ${data.price}",
                      color: MyAppColor.btnColor,
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
    });
  }
}
