import 'package:flutter/material.dart';
import 'package:mf_foodmart/api_handler/api_Service.dart';
import 'package:mf_foodmart/screens/categories/view_all_categories.dart';
import 'package:mf_foodmart/screens/home/components/banner.dart';
import 'package:mf_foodmart/screens/categories/home_categories.dart';
import 'package:mf_foodmart/screens/products/product_screen.dart';
import 'package:mf_foodmart/screens/home/components/search_field.dart';
import 'package:mf_foodmart/screens/home/components/view_all_button.dart';
import 'package:mf_foodmart/screens/products/view_all_products.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiService.fetchProduct(page: 1, perPage: 15);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            /// Search bar--------------------------------
            const SearchField(),
            const SizedBox(height: 10),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Banner -----------------------------
                  const HomeBanner(),
                  const SizedBox(height: 15),

                  /// View all Categories Button-----------------
                  ViewAllButton(
                    text: "Categories",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllCategories()));
                    },
                  ),

                  /// Home Categories --------------------------------
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: HomeCategories()),
                  const SizedBox(height: 10),

                  /// View All Popular Product Button ----------------------
                  ViewAllButton(
                    text: "Popular Product",
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAllProduct()));
                    },
                  ),


                  /// Popular Product -------------------------------------
                  SizedBox(child: ProductScreen())
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}


