
import 'package:dream_diary/fake_data/model/dream_model.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/screens/interpretators/interpretators_screen.dart';
import 'package:dream_diary/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class DetailDreamScreen extends StatefulWidget {
  DetailDreamScreen( {super.key, required this.model});

  DreamModel model;

  @override
  State<DetailDreamScreen> createState() => _DetailDreamScreenState();
}

class _DetailDreamScreenState extends State<DetailDreamScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
            Container(
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.model.title.toString(),
                      style: GoogleFonts.epilogue(
                        textStyle: AppStyles.boldWhiteHeading,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 1, color: AppColors.white),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.bgElements
                    ),
                    child: Text(
                      widget.model.description.toString(),
                      style: GoogleFonts.mulish(
                        textStyle: AppStyles.regularWhiteText,
                        color: AppColors.gray
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.bgElements
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: widget.model.emotions!
                          .map((tag) => FilterChip(
                        label: Text(tag, style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.white)),
                        backgroundColor: AppColors.bgElements,
                        onSelected: (bool value) {},
                        shape: const StadiumBorder(side: BorderSide(color: AppColors.secondColor)),
                      ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.bgElements
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.mainColor.withOpacity(0.3)
                          ),
                          child: SvgPicture.asset(
                            "assets/svg/moon.svg",
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add to a dream guide", style: GoogleFonts.mulish(
                              textStyle: AppStyles.regularWhiteText14,
                            ),),
                            Text("(5 times left)", style: GoogleFonts.mulish(
                              textStyle: AppStyles.regularWhiteText14,
                            )),
                          ],
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.arrow_forward_ios, color: AppColors.secondColor, size: 16,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InterpretatorScreen())),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.bgElements
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.mainColor.withOpacity(0.3)
                            ),
                            child: SvgPicture.asset(
                              "assets/svg/moon.svg",
                            ),
                          ),
                          const SizedBox(width: 14),
                          Flexible(
                            child: Text("Compare dreams with common symbols and interpretations", style: GoogleFonts.mulish(
                              textStyle: AppStyles.regularWhiteText14,
                            ),),
                          ),
                          const SizedBox(width: 20),
                          const Icon(Icons.arrow_forward_ios, color: AppColors.secondColor, size: 16,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Share.share('Share');
              },
              child: Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.bgElements
                ),
                child: SvgPicture.asset(
                  "assets/svg/out.svg",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ButtonWidget(
              height: 50,
              title: "Go home",
              isDisabledBtn: false,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}