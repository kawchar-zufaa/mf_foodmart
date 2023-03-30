import 'package:flutter/material.dart';
import 'package:mf_foodmart/api_handler/api_Service.dart';
import 'package:mf_foodmart/models/cat_wise_product_model.dart';
import 'package:mf_foodmart/screens/details/details_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/search_field.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CategoriesScreen extends StatefulWidget {
  final int cid;
  final String name;
  CategoriesScreen({Key? key, required this.cid, required this.name})
      : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var categoriesList = <CatWiseProductModel>[];
  var isLoading = false;

  Future<void> fetchData() async {
    try {
      isLoading = true;

      final data = await ApiService.fetchCatWaysProduct(cid: widget.cid);
      if (data != null) {
        setState(() {
          categoriesList.addAll(data);
        });
      }
    } catch (e) {
      print("something went wrong ${e.toString()}");
    } finally {
      isLoading = false;
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyAppColor.bgColor,
        appBar: AppBar(
            iconTheme: const IconThemeData(color: MyAppColor.textColor),
            backgroundColor: MyAppColor.bgColor,
            elevation: 0,
            centerTitle: true,
            title: TextWidget(
              text: widget.name,
              color: MyAppColor.textColor,
              size: 20,
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchField(),
              ),
            )),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : categoriesList.isEmpty
                ? const Center(
                    child: Text("No found this item"),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: categoriesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final data = categoriesList[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: MyAppColor.productBG,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 35,
                              top: 15,
                              child: Container(
                                height: 120,
                                width: 120,
                                child: BuildImage(
                                  size: size,
                                  imgUrl: data.images!.isNotEmpty
                                      ? data.images!.first.src.toString()
                                      : "",
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                color: Color(0xffF53D3D),
                                size: 30,
                              ),
                            ),
                            Positioned(
                              bottom: 40,
                              left: 10,
                              child: Container(
                                  width: size.width / 3,
                                  child: TextWidget(
                                    text: data.name.toString(),
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
                                        pId: data.id!.toInt(),
                                        images: data.images!,
                                        cid: data.categories!.first.id,
                                        catName: data.categories![0].name,
                                        pName: data.name.toString(),
                                        price: data.price.toString(),
                                        description: data.description!,
                                        shortDescription:
                                            data.shortDescription!,
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
                              bottom: 10,
                              left: 10,
                              child: TextWidget(
                                text: "CAD ${data.price}",
                                color: MyAppColor.btnColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ));
  }
}
