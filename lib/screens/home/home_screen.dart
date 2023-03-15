import 'package:flutter/material.dart';
import 'package:mf_foodmart/screens/home/components/banner.dart';
import 'package:mf_foodmart/screens/home/components/home_categories.dart';
import 'package:mf_foodmart/screens/home/components/search_field.dart';
import 'package:mf_foodmart/screens/home/components/view_all.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 10),

                  /// View all Categories Button-----------------
                  ViewAll(
                    text: "Categories",
                    onTap: () {
                      print("categories");
                    },
                  ),

                  /// Home Categories --------------------------------
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: HomeCategories()),
                  const SizedBox(height: 10),

                  /// View All Popular Product Button ----------------------
                  ViewAll(
                    text: "Popular Product",
                    onTap: () {
                      print("Popular product");
                    },
                  ),

                  /// Popular Product -------------------------------------
                  SizedBox(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 100,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 300,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.yellow,
                        );
                      },
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
