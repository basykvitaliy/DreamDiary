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
      body: _buildScreens()[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        selectedItemColor: AppColors.secondColor,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_1.svg",
                width: 25,
                height: 25,
                color: AppColors.gray,
              ),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_1.svg",
                width: 25,
                height: 25,
                color: AppColors.secondColor,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 6),
                child: SvgPicture.asset(
                  "assets/svg/menu_icon_2.svg",
                  width: 25,
                  height: 25,
                  color: AppColors.gray,
                ),
              ),
              activeIcon: Container(
                padding: const EdgeInsets.only(bottom: 6),
                child: SvgPicture.asset(
                  "assets/svg/menu_icon_2.svg",
                  width: 25,
                  height: 25,
                  color: AppColors.secondColor,
                ),
              ),
              label: "Foundings"),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_3.svg",
                width: 25,
                height: 25,
                color: AppColors.gray,
              ),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_3.svg",
                width: 25,
                height: 25,
                color: AppColors.secondColor,
              ),
            ),
            label: "Techniques",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_4.svg",
                width: 25,
                height: 25,
                color: AppColors.gray,
              ),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_4.svg",
                width: 25,
                height: 25,
                color: AppColors.secondColor,
              ),
            ),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_5.svg",
                width: 25,
                height: 25,
                color: AppColors.gray,
              ),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(
                "assets/svg/menu_icon_5.svg",
                width: 25,
                height: 25,
                color: AppColors.secondColor,
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
