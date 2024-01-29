import 'package:dream_diary/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoundingsScreen extends StatefulWidget {
  FoundingsScreen({super.key});

  @override
  State<FoundingsScreen> createState() => _FoundingsScreenState();

}

class _FoundingsScreenState extends State<FoundingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 10,
        automaticallyImplyLeading: false,
        title: Text("Foundings"),
      ),
      backgroundColor: AppColors.lightGray,
      body: Container(),
    );
  }
}


