import 'dart:async';

import 'package:dream_diary/helpers/constants.dart';
import 'package:dream_diary/screens/menu/menu_screen.dart';
import 'package:dream_diary/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      _checkShowOnboarding().then((_) {
      });
    });
    super.initState();
  }

  Future<void> _checkShowOnboarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isShowOnboarding = true;
    if (sharedPreferences.containsKey(Keys.isShowOnboarding)) {
      isShowOnboarding = sharedPreferences.getBool(Keys.isShowOnboarding);
    }
    if (isShowOnboarding == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MenuScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/splash_bg.png", fit: BoxFit.cover)),
          Center(
            child: Image.asset("assets/images/logo.png", scale: 2,),
          ),
        ],
      ),
    );
  }
}


