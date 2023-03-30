import 'package:flutter/material.dart';
import 'package:mf_foodmart/screens/categories/view_all_categories.dart';
import 'package:mf_foodmart/screens/home/components/banner.dart';
import 'package:mf_foodmart/screens/categories/home_categories.dart';
import 'package:mf_foodmart/screens/products/product_screen.dart';
import 'package:mf_foodmart/widgets/search_field.dart';
import 'package:mf_foodmart/widgets/view_all_button.dart';
import 'package:mf_foodmart/screens/products/view_all_products.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [


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
                    viewText: 'View All',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllCategories()));
                    },
                  ),


                  /// Home Categories --------------------------------
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: HomeCategories()),



                  /// View All Popular Product Button ----------------------
                  const SizedBox(height: 10),
                  ViewAllButton(
                    text: "Popular Product",
                    viewText: 'View All',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllProduct()));
                    },
                  ),
                  

                  /// Popular Product -------------------------------------
                  const SizedBox(height: 8),
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
