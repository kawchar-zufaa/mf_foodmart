import 'package:flutter/material.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black38
        ),
        backgroundColor: MyAppColor.productBG,
        elevation: 0,
        title:TextWidget(text: "About us",color:Colors.black38,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

            TextWidget(text: 'About MF FOOD MART',size: 30,color: MyAppColor.btnColor,),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextWidget(
                text: "Welcome to MF FOODMART APP, your number one source for all kinds of groceries. We are dedicated to giving you the best value for your money. We offer fresh goods at the lowest prices with a wide range of options,"
                    " so that you can shop all your groceries through just one click."

                  "Founded in 2007 as a family-run business, MF FOODMART APP has come a long way from its beginnings in Ottawa"
                      ". When we first started out, our passion for supplying the best desi groceries at the lowest prices has driven us to expand and"
            "  import fresh produce from countries all across Southeast Asia, Africa & the Middle East, so that MF FOODMART APP can offer you"
              "the most extensive variety of grocery products. We now have two locations serving customers all over Ottawa."

                  "Looking for Bangladeshi fish, fresh desi vegetables & fruits, halal beef, veal, lamb, goat and chicken? Come visit us!",
              ),
            )
          ],
        ),
      ),
    );
  }
}
