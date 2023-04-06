import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mf_foodmart/api_handler/api_Service.dart';
import 'package:mf_foodmart/database_helper/cart_database/cart_database.dart';
import 'package:mf_foodmart/models/cart_model.dart';
import 'package:mf_foodmart/models/cat_wise_product_model.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/show_html_code.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';
import 'package:mf_foodmart/widgets/view_all_button.dart';

class DetailsScreen extends StatefulWidget {
  final int pId;
  final List images;
  final int cid;
  final String catName;
  final String pName;
  final String price;
  final String description;
  final String shortDescription;
  const DetailsScreen(
      {Key? key,
        required this.pId,
      required this.images,
      required this.cid,
      required this.catName,
      required this.pName,
      required this.price,
      required this.description,
      required this.shortDescription,
      })
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _currentIndex = 0;
  int count=1;
  var _isRemove=false;
  var _isAdd=false;
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
                ///  Product image and   Dots indicator ...............
                _buildImageDotsIndicator(size),

                /// Back button and Favourite button ...................
                _backAndFavoriteButton(context),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///  Category name......................
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 7),
                    height: size.height / 20,
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

                  /// Product name and price.............
                  SizedBox(height: size.height / 80),
                  _nameAndPrice(size),

                  /// Rating and Count button............
                  SizedBox(height: size.height / 78),
                  _ratingAndCountButton(
                    removeButton: () {
                      if(count==1){
                        Fluttertoast.showToast(msg: "Quantity is low");
                      }else if(count>1){
                        setState(() {
                          _isRemove=true;
                          _isAdd=false;
                          count--;
                        });
                      }
                    },
                    text: "$count",
                    addButton: () {

                         setState(() {
                           _isAdd=true;
                           _isRemove=false;
                           count++;
                         });

                    },
                  ),

                  /// Description .....................
                  const SizedBox(height: 15),
                  _description(size),

                  /// Related Product sell all button..............
                  ViewAllButton(
                    text: "Related Product",
                    onTap: () {},
                    viewText: 'See All',
                  ),

                  /// Related Product ...................
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _relatedProduct(size),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        onTap: (){

           if(widget.price.isEmpty|| widget.price==null){
             Fluttertoast.showToast(msg: "This product Unavailable");
           }else{
             CartModel cartModel=CartModel(
                 productId:widget.pId ,
                 productImage: widget.images[0].src,
                 productName: widget.pName,
                 productPrice: widget.price,
                 count: count
             );

             CartDatabase.instance.insertCartItem(cartModel);

           }




        },
        text: "Add to cart",
      ),
    );
  }

  Widget _description(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: 'Description'),
        const SizedBox(height: 8),
        widget.description.isEmpty && widget.shortDescription.isEmpty
            ? Container(
                alignment: Alignment.center,
                height: size.height / 7,
                width: size.width,
                child: TextWidget(
                  text: "Empty Description",
                ),
              )
            :
        Container(
                height: size.height / 7,
                width: size.width,
                child: widget.description.isEmpty
                    ? ShowHtmlCode(htmlCode: widget.shortDescription)
                    : ShowHtmlCode(htmlCode: widget.description)),
      ],
    );
  }

  Widget _ratingAndCountButton(
      {required VoidCallback removeButton,
      required String text,
      required VoidCallback addButton}) {
    return Row(
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
              backgroundColor:_isRemove?MyAppColor.btnColor:Colors.grey[300],
              radius: 12,
              child: InkWell(
                onTap: removeButton,
                child: Icon(
                  Icons.remove,
                  size: 16,color: _isRemove?Colors.white:MyAppColor.btnColor,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            TextWidget(text: text),
            const SizedBox(width: 5),
            CircleAvatar(
              backgroundColor:_isAdd? MyAppColor.btnColor:Colors.grey[300],
              radius: 12,
              child: InkWell(
                onTap: addButton,
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: _isAdd?Colors.white:MyAppColor.btnColor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _nameAndPrice(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 50,
            width: size.width/2,
            child: TextWidget(text: widget.pName,maxLines: 2,)),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
          ),
        ),
      ],
    );
  }

  Widget _relatedProduct(Size size) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(categoriesList.length, (index) {
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
                        padding: const EdgeInsets.only(top: 2, left: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: data.name.toString(),
                              size: 10,
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            data.price == null
                                ? TextWidget(text: "Upcoming price")
                                : TextWidget(
                                    text: "CAD ${data.price}",
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
    );
  }

  Widget _backAndFavoriteButton(BuildContext context) {
    return Positioned(
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
    );
  }

  Widget _buildImageDotsIndicator(Size size) {
    return Container(
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
        ));
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
