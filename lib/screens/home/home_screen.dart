
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/screens/add_dream/add_dream_screen.dart';
import 'package:dream_diary/widget/button_widget.dart';
import 'package:dream_diary/widget/diary_page_widget.dart';
import 'package:dream_diary/widget/dreampage_widget.dart';
import 'package:dream_diary/widget/out_shadow_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final GlobalKey<DiaryPageWidgetState> _childKey = GlobalKey();

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
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
            SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "Dream Diary",
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
                                color: _selectedIndex == 0 ? AppColors.bgElements : Colors.transparent,
                                boxShadow: _selectedIndex == 0 ? OutShadowWidget().showOutShadow() : null
                            ),
                            child: Center(
                              child: Text(
                                "Diary",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.epilogue(
                                  textStyle: AppStyles.regularGreyText16,
                                  color: _selectedIndex == 0 ? AppColors.secondColor : AppColors.gray,
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
                                color: _selectedIndex == 1 ? AppColors.bgElements : Colors.transparent,
                                boxShadow: _selectedIndex == 1 ? OutShadowWidget().showOutShadow() : null
                            ),
                            child: Center(
                              child: Text(
                                "Dream Guide",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.epilogue(
                                  textStyle: AppStyles.regularGreyText16,
                                  color: _selectedIndex == 1 ? AppColors.secondColor : AppColors.gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      children: [
                        DiaryPageWidget(key: _childKey),
                        DreamPageWidget(),
                      ],
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
          title: "Add a Dream",
          isDisabledBtn: false,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddDreamScreen())).then((value) {
              _childKey.currentState?.loadDreams();
            });
          }
        ),
      ),
    );
  }
}
