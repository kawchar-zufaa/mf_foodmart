import 'package:flutter/material.dart';
import 'package:mf_foodmart/api_handler/api_Service.dart';
import 'package:mf_foodmart/models/cat_wise_product_model.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/show_html_code.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class DetailsScreen extends StatefulWidget {
  final List images;
  final int cid;
  final String catName;
  final String pName;
  final String price;
  final String description;
  final String shortDescription;
  const DetailsScreen(
      {Key? key,
      required this.images,
      required this.cid,
      required this.catName,
      required this.pName,
      required this.price,
      required this.description,
      required this.shortDescription})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _currentIndex = 0;

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
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height / 2.85,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xffD8F4EB),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Stack(
                    children: [
                      PageView.builder(
                          itemCount: widget.images.length,
                          onPageChanged: (value) {
                            setState(() {
                              _currentIndex = value;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: BuildImage(
                                  size: size,
                                  imgUrl: widget.images.isNotEmpty
                                      ? widget.images[index].src
                                      : ""),
                            );
                          }),
                      Positioned(
                        bottom: 5,
                        left: size.width / 2.2,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _buildPageIndicator()),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        TextWidget(
                          text: "Product Details",
                          size: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 7),
                    height: size.height / 15,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffD8F4EB)),
                    child: TextWidget(
                      text: widget.catName,
                      size: 10,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: widget.pName),
                      Row(
                        children: [
                          TextWidget(
                            text: "CAD ${widget.price}",
                            color: MyAppColor.btnColor,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            text: '/ per lbs',
                            color: MyAppColor.iconColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height / 78,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Color(0xffFFA542),
                                    )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextWidget(
                            text: "(24)",
                            color: MyAppColor.iconColor,
                            size: 14,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 12,
                            child: const InkWell(
                              child: Icon(
                                Icons.remove,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextWidget(text: "1"),
                          const SizedBox(
                            width: 5,
                          ),
                          const CircleAvatar(
                            backgroundColor: MyAppColor.btnColor,
                            radius: 12,
                            child: InkWell(
                              child: Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(text: 'Description'),
                  const SizedBox(
                    height: 8,
                  ),
                  widget.description.isEmpty || widget.shortDescription.isEmpty
                      ? Container(
                    alignment: Alignment.center,
                          height: size.height / 7,
                          width: size.width,
                          child: TextWidget(
                            text: "Empty Description",
                          ),
                        )
                      : Container(
                          height: size.height / 7,
                          width: size.width,
                          child: widget.description.isEmpty
                              ? ShowHtmlCode(htmlCode: widget.description)
                              : ShowHtmlCode(htmlCode: widget.description)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Related Product",
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      InkWell(
                        child: TextWidget(
                          text: "See All",
                          size: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children:
                                  List.generate(categoriesList.length, (index) {
                            final data = categoriesList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: categoriesList.isEmpty
                                  ? Center(
                                      child: TextWidget(
                                        text: "No related product found",
                                      ),
                                    )
                                  : Container(
                                      height: size.height / 7,
                                      width: 80,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 50,
                                              width: size.height,
                                              color: const Color(0xffDEE3E0),
                                              child: BuildImage(
                                                size: size,
                                                imgUrl: data.images!.isNotEmpty
                                                    ? data.images!.first.src
                                                    : "",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2, left: 4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  text: data.name.toString(),
                                                  size: 10,
                                                  maxLines: 2,
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                data.price==null?TextWidget(text: "Upcoming price"):TextWidget(
                                                  text:"CAD ${data.price}",
                                                  size: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: MyAppColor.btnColor,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            );
                          })),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {},
        text: "Add to cart",
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < widget.images.length; i++) {
      indicators.add(_currentIndex == i
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 7.0,
              width: 25.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyAppColor.btnColor),
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: 8.0,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff9A9A9A)),
            ));
    }
    return indicators;
  }
}
