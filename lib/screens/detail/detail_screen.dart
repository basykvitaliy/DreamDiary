import 'package:dream_diary/fake_data/fake_list.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imgPath,
  });

  String title;
  String description;
  String imgPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.gray,
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: GoogleFonts.epilogue(
                      textStyle: AppStyles.boldWhiteHeading,
                    ),
                  ),
                  Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
