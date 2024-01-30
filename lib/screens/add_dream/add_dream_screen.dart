import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/widget/button_widget.dart';
import 'package:dream_diary/widget/diary_page_widget.dart';
import 'package:dream_diary/widget/dreampage_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDreamScreen extends StatefulWidget {
  const AddDreamScreen({super.key});

  @override
  State<AddDreamScreen> createState() => _AddDreamScreenState();
}

class _AddDreamScreenState extends State<AddDreamScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    GestureDetector(
                      onTap:() => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: AppColors.gray,))
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Title",
                  style: GoogleFonts.epilogue(
                    textStyle: AppStyles.boldWhiteHeading,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonWidget(
        height: 50,
        title: "Complete",
        isDisabledBtn: false,
      ),
    );
  }
}
