import 'package:flutter/material.dart';
import 'package:mf_foodmart/screens/main/main_screen.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(

            image: AssetImage('assets/images/onboard_bg.png'),fit: BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/onbarad_img.png',width: 250,height: 250,),
            TextWidget(text: 'Welcome to our Grocery Shop'),
            TextWidget(text: 'Fresh Food Desi Taste',size: 14,color: Colors.grey,),
            const SizedBox(height: 10,),
            CustomButton(onTap: ()async{
              SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
              await sharedPreferences.setBool('isOnboardingShown', true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            }, text: "Get Started",isResponsive: true,)
          ],
        ),
      )
    );
  }
}
