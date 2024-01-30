import 'package:dream_diary/fake_data/fake_list.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/screens/detail/detail_screen.dart';
import 'package:dream_diary/widget/dreampage_widget.dart';
import 'package:dream_diary/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoundingsScreen extends StatefulWidget {
  FoundingsScreen({super.key});

  @override
  State<FoundingsScreen> createState() => _FoundingsScreenState();

}

class _FoundingsScreenState extends State<FoundingsScreen> {

  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(width: MediaQuery
                .of(context)
                .size
                .width, height: MediaQuery
                .of(context)
                .size
                .height, child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "Foundings",
                    style: GoogleFonts.epilogue(
                      textStyle: AppStyles.boldWhiteHeading,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _onItemTapped(0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: _selectedIndex == 0 ? AppColors.secondColor : AppColors.gray),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "Foundings",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.epilogue(
                                  textStyle: AppStyles.regularGreyText16,
                                  color: _selectedIndex == 0 ? Colors.white : AppColors.gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _onItemTapped(1),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: _selectedIndex == 1 ? AppColors.secondColor : AppColors.gray),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "Articles",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.epilogue(
                                  textStyle: AppStyles.regularGreyText16,
                                  color: _selectedIndex == 1 ? Colors.white : AppColors.gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      children: [
                        ListWidget(
                          imgList: foundingsImgList,
                          titleList: foundingsTitleList,
                          subTitleList: [],
                          onTap: (index) => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(title: foundingsTitleList[index], description: '', imgPath: foundingsImgList[index]))),
                        ),
                        ListWidget(
                          imgList: articlesImgList,
                          titleList: articlesTitleList,
                          subTitleList: [],
                          onTap: (index) => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(title: articlesTitleList[index], description: '', imgPath: articlesImgList[index]))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


