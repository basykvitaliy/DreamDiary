import 'package:dream_diary/fake_data/fake_list.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/screens/detail/detail_screen.dart';
import 'package:dream_diary/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechniquesScreen extends StatefulWidget {
  const TechniquesScreen({super.key});

  @override
  State<TechniquesScreen> createState() => _TechniquesScreenState();

}

class _TechniquesScreenState extends State<TechniquesScreen> {

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
                  Text(
                    "Techniques",
                    style: GoogleFonts.epilogue(
                      textStyle: AppStyles.boldWhiteHeading,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ListWidget(
                    imgList: techniquesImgList,
                    titleList: techniquesTitleList,
                    subTitleList: techniquesSubTitleList,
                    onTap: (index) => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(title: techniquesTitleList[index], description: techniquesSubTitleList[index], imgPath: techniquesImgList[index]))),
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


