import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/screens/foundings/foundings_screen.dart';
import 'package:dream_diary/screens/home/home_screen.dart';
import 'package:dream_diary/screens/settings/settings_screen.dart';
import 'package:dream_diary/screens/statistic/statistic_screen.dart';
import 'package:dream_diary/screens/techniques/technicques_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();

}

class _MenuScreenState extends State<MenuScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 10,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.lightGray,
      body: _buildScreens()[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.mainColor,
        selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_1.svg",
                width: 30,
                height: 30,
                color: AppColors.gray,
              ),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_1.svg",
                width: 30,
                height: 30,
                color: AppColors.mainColor,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 6),
                child: SvgPicture.asset(
                  "assets/svg/menu_icon_2.svg",
                  width: 30,
                  height: 30,
                  color: AppColors.gray,
                ),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.only(bottom: 6),
                child: SvgPicture.asset(
                  "assets/svg/menu_icon_2.svg",
                  width: 30,
                  height: 30,
                  color: AppColors.mainColor,
                ),
              ),
              label: "Foundings"),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_3.svg",
                width: 30,
                height: 30,
                color: AppColors.gray,
              ),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_3.svg",
                width: 30,
                height: 30,
                color: AppColors.mainColor,
              ),
            ),
            label: "Techniques",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_4.svg",
                width: 30,
                height: 30,
                color: AppColors.gray,
              ),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_4.svg",
                width: 30,
                height: 30,
                color: AppColors.mainColor,
              ),
            ),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_5.svg",
                width: 30,
                height: 30,
                color: AppColors.gray,
              ),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_5.svg",
                width: 30,
                height: 30,
                color: AppColors.mainColor,
              ),
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomeScreen(),
    FoundingsScreen(),
    TechniquesScreen(),
    StatisticScreen(),
    SettingsScreen()
  ];
}
