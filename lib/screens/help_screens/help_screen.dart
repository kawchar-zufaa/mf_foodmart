import 'package:flutter/material.dart';
import 'package:mf_foodmart/screens/help_screens/components/about_us.dart';
import 'package:mf_foodmart/screens/help_screens/components/privacy_policy.dart';
import 'package:mf_foodmart/screens/help_screens/components/terms_condition.dart';
import 'package:mf_foodmart/screens/main/main_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black38),
        backgroundColor: MyAppColor.productBG,
        elevation: 0,
        title: TextWidget(
          text: "Help",
          color: Colors.black38,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Image.asset(
              "assets/icons/MF-logo-latestv.png",
              width: 200,
              height: 200,
            ),
            ListTile(
              leading: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivecyPolicy()));
                },
                child: TextWidget(
                  text: "Privacy Policy",
                ),
              ),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
            ),
            ListTile(
              leading: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AboutUs()));
                },
                child: TextWidget(
                  text: "About Us",
                ),
              ),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
            ),
            ListTile(
              leading: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TermsCondition()));
                },
                child: TextWidget(
                  text: "Terms & Condition",
                ),
              ),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyAppColor.btnColor),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                },
                child: TextWidget(
                  text: "Shop now",
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
