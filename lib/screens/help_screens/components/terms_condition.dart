import 'package:flutter/material.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({Key? key}) : super(key: key);

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
        title:TextWidget(text: "Terms & Condition",color:Colors.black38,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [

            TextWidget(text: 'TERMS OF SERVICE',size: 30,color: MyAppColor.btnColor,),
            const SizedBox(height: 20,),
            TextWidget(text: 'OVERVIEW',size: 20,),

            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextWidget(
                text: "This App is operated by MF FOODMART. Throughout the site, the terms “we”, “us” and “our” refer to MF FOODMART."
                    " MF FOODMART offers this App, including all information, tools and services available from this site to you, the user,"
                    " conditioned upon your acceptance of all terms, conditions, policies and notices stated here.",
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextWidget(
                text: "By Entering our App and/ or purchasing something from us, you engage in our "
                    "“Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), "
                    "including those additional terms and conditions and policies referenced herein "
                    "and/or available by hyperlink. These Terms of Service apply  to all users of the site, including without"
                    " limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.",
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextWidget(
                text: "Please read these Terms of Service carefully before accessing or using our App."
                    " By accessing or using any part of the site, you agree to be bound by these Terms of Service. "
                    "If you do not agree to all the terms and conditions of this agreement, then you may not access the App or use any services. "
                    "If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.",
              ),
            ),

          ],
        ),
      ),
    );
  }
}
