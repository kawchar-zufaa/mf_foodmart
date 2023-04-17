import 'package:flutter/material.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class PrivecyPolicy extends StatelessWidget {
  const PrivecyPolicy({Key? key}) : super(key: key);

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
        title:TextWidget(text: "Privacy policy",color:Colors.black38,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

            TextWidget(text: 'MF FOODMART Privacy Policy',size: 30,color: MyAppColor.btnColor,),
            const SizedBox(height: 20,),
            TextWidget(text: 'PERSONAL INFORMATION WE COLLECT',size: 20,),

            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextWidget(
                text: "When you Enter the App, we automatically collect "
                    "certain information about your device, including information about your web browser,"
                    " IP address, time zone, and some of the cookies that are installed on your device."
                    " Additionally, as you browse the App, we collect information about the individual web pages or products"
                    " that you view, what App or search terms referred you to the App, and information about how you interact"
                    " with the App. We refer to this automatically-collected information as “Device Information.”",
              ),
            )
          ],
        ),
      ),
    );
  }
}
