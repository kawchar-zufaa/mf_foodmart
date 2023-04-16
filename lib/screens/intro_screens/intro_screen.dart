import 'package:flutter/material.dart';
import 'package:mf_foodmart/screens/main/main_screen.dart';
import 'package:mf_foodmart/screens/onboarding/onboarding_screen.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  bool isOnboardingShown = false;

  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }

  void checkOnboardingStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isShown = sharedPreferences.getBool('isOnboardingShown') ?? false;
    setState(() {
      isOnboardingShown = isShown;
    });
    if (isOnboardingShown) {
      // Navigate to home screen after a delay
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      });
    } else {
      // Show onboarding screen after a delay
      Future.delayed(const Duration(seconds: 2), () async {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
        // Set the flag to true after showing onboarding screen
        await sharedPreferences.setBool('isOnboardingShown', true);
        setState(() {
          isOnboardingShown = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",width: 250,height: 250,),
            const SizedBox(height: 100,),
            const Center(
              child: CircularProgressIndicator(),
            ),
            const SizedBox(height: 20,),
            TextWidget(text: 'Online Grocery Shop')
          ],
        ),
      ),
    );
  }
}
