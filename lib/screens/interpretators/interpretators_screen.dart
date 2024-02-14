import 'dart:math';

import 'package:dream_diary/fake_data/fake_list.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterpretatorScreen extends StatefulWidget {
  InterpretatorScreen({
    super.key,
  });

  @override
  State<InterpretatorScreen> createState() => _InterpretatorScreenState();
}

class _InterpretatorScreenState extends State<InterpretatorScreen> {

  String randomElement = getRandomElement(keyMomentsInterpretationsList);

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
                      InkResponse(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.gray,
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Interpretations",
                    style: GoogleFonts.epilogue(
                      textStyle: AppStyles.boldWhiteHeading,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.bgElements
                    ),
                    child: Text(
                      randomElement,
                      style: GoogleFonts.mulish(
                        textStyle: AppStyles.regularMainText16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String getRandomElement(List<String> list) {
  final random = Random();
  int index = random.nextInt(list.length);
  return list[index];
}
