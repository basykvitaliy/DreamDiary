import 'package:dream_diary/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatisticScreen extends StatefulWidget {
  StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();

}

class _StatisticScreenState extends State<StatisticScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 10,
        automaticallyImplyLeading: false,
        title: Text("Statistic"),
      ),
      backgroundColor: AppColors.lightGray,
      body: Container(),
    );
  }
}


