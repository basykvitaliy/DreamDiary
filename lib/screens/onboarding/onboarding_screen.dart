
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/screens/menu/menu_screen.dart';
import 'package:dream_diary/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 8.0 : 8.0,
      width: isActive ? 14.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuScreen())),
                    child: Text(
                      'Skip',
                      style: GoogleFonts.mulish(
                        textStyle: AppStyles.regularGreyText16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      _buildPageContent(
                        image: "assets/svg/onboard_1.svg",
                        title: 'Discover Your Dreams',
                        body: 'Dive into the mystical world of dreams and discover their hidden meanings. Record, analyze, and understand your dreams to gain insights into your subconscious mind.',
                      ),
                      _buildPageContent(
                        image: "assets/svg/onboard_2.svg",
                        title: 'Unlock the Secrets of Your Dreams',
                        body: 'Access a wealth of research and articles on dream psychology. Learn from experts and explore various techniques for lucid dreaming to enhance your spiritual and mental clarity.',
                      ),
                      _buildPageContent(
                        image: "assets/svg/onboard_3.svg",
                        title: 'Personal Growth and Insights',
                        body: 'Track your dream patterns with statistics and daily reminders. Create a personalized dream guide and share your dream journey with friends to explore the richness of your inner world.',
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? ButtonWidget(
                        height: 50,
                        title: "Next",
                        isDisabledBtn: false,
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      )
                    : ButtonWidget(
                        height: 50,
                        title: "Continue",
                        isDisabledBtn: false,
                        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuScreen())),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent({
    required String image,
    required String title,
    required String body,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
        ),
        const SizedBox(height: 30.0),
        Text(
          title,
          style: GoogleFonts.epilogue(
            textStyle: AppStyles.boldWhiteHeading,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15.0),
        Text(
          body,
          style: GoogleFonts.mulish(
            textStyle: AppStyles.regularGreyText16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
