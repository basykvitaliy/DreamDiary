import 'package:dream_diary/fake_data/fake_list.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/helpers/constants.dart';
import 'package:dream_diary/screens/detail/detail_screen.dart';
import 'package:dream_diary/screens/premium/premium_screen.dart';
import 'package:dream_diary/widget/buy_premium_widget.dart';
import 'package:dream_diary/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechniquesScreen extends StatefulWidget {
  const TechniquesScreen({super.key});

  @override
  State<TechniquesScreen> createState() => _TechniquesScreenState();
}

class _TechniquesScreenState extends State<TechniquesScreen> {
  bool isPremium = false;

  @override
  void initState() {
    _checkPremium().then((value) {
      setState(() {
        isPremium = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
          isPremium
              ? SingleChildScrollView(
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
                        const SizedBox(height: 8),
                        ListWidget(
                          imgList: techniquesImgList,
                          titleList: techniquesTitleList,
                          subTitleList: techniquesSubTitleList,
                          onTap: (index) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      title: techniquesTitleList[index],
                                      description: techniquesSubTitleList[index],
                                      imgPath: techniquesImgList[index]))),
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, left: 16),
                      child: Text(
                        "Techniques",
                        style: GoogleFonts.epilogue(
                          textStyle: AppStyles.boldWhiteHeading,
                        ),
                      ),
                    ),
                    Center(
                        child: BuyPremiumWidget(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumScreen())),
                    )),
                    const SizedBox(height: 50),
                  ],
                ),
        ],
      ),
    );
  }
}

Future<bool> _checkPremium() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isShowOnboarding = false;
  if (sharedPreferences.containsKey(Keys.isPremium)) {
    isShowOnboarding = sharedPreferences.getBool(Keys.isPremium)!;
  }
  return isShowOnboarding;
}
