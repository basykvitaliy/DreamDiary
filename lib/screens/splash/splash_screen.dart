import 'dart:async';

import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/screens/home/home_screen.dart';
import 'package:dream_diary/screens/menu/menu_screen.dart';
import 'package:dream_diary/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), _navigateToNextPage);
  }

  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
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


