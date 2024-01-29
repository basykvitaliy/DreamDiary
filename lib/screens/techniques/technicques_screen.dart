import 'package:dream_diary/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TechniquesScreen extends StatefulWidget {
  TechniquesScreen({super.key});

  @override
  State<TechniquesScreen> createState() => _TechniquesScreenState();

}

class _TechniquesScreenState extends State<TechniquesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 10,
        automaticallyImplyLeading: false,
        title: Text("Techniques"),
      ),
      backgroundColor: AppColors.lightGray,
      body: Container(),
    );
  }
}


