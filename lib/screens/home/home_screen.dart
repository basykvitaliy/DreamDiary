
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "Dream Diary",
                style: GoogleFonts.epilogue(
                  textStyle: AppStyles.boldWhiteHeading,
                ),
              ),
              ButtonWidget(
                height: 50,
                title: "Next",
                isDisabledBtn: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
