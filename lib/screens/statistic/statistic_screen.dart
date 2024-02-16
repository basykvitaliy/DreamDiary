import 'dart:math';

import 'package:dream_diary/fake_data/model/dream_model.dart';
import 'package:dream_diary/fake_data/sql_db/SqlDbRepository.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  String formattedDate = "";
  String sleepTime = "";

  @override
  void initState() {
    var date = DateTime.now();
    formattedDate = DateFormat('dd MMMM').format(date);
    loadDreams();
    super.initState();
  }

  Future<void> loadDreams() async {
    try {
      var dreams = await getDreams();
      setState(() {
        List<String> parts = dreams.last.sleepTime!.split(" : ");
        int hours = int.parse(parts[0]);
        int minutes = int.parse(parts[1]);
        sleepTime = "${hours}h ${minutes.toString().padLeft(2, '0')}m";

      });
    } catch (e) {
      print(e);
    }
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
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formattedDate,
                          style: GoogleFonts.epilogue(
                            textStyle: AppStyles.boldWhiteHeading,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Statistics",
                          style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
                      child: Stack(
                        children: [
                          ClipRRect(
                           borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                            child: SvgPicture.asset(
                              "assets/svg/bg_1.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Duration",
                                  style: GoogleFonts.epilogue(
                                    textStyle: AppStyles.regularWhiteText,
                                  ),
                                ),
                                const SizedBox(height: 1),
                                Text(
                                  sleepTime,
                                  style: GoogleFonts.epilogue(
                                    textStyle: AppStyles.boldWhiteHeading,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 6,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 50,
                                      height: 6,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.secondColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Most frequent symbols",
                          style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SvgPicture.asset(
                              "assets/svg/bg_2.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Wrap(
                              spacing: 12.0,
                              runSpacing: 0,
                              alignment: WrapAlignment.center,
                              children: [
                                FilterChip(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  label: Text("Water", style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.white)),
                                  backgroundColor: AppColors.bgElements,
                                  onSelected: (bool value) {},
                                  shape: const StadiumBorder(side: BorderSide(color: AppColors.secondColor)),
                                ),
                                FilterChip(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  label: Text("Flying", style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.white)),
                                  backgroundColor: AppColors.bgElements,
                                  onSelected: (bool value) {},
                                  shape: const StadiumBorder(side: BorderSide(color: AppColors.secondColor)),
                                ),
                                FilterChip(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  label: Text("Falling", style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.white)),
                                  backgroundColor: AppColors.bgElements,
                                  onSelected: (bool value) {},
                                  shape: const StadiumBorder(side: BorderSide(color: AppColors.secondColor)),
                                ),
                                FilterChip(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  label: Text("Being Chased", style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.white)),
                                  backgroundColor: AppColors.bgElements,
                                  onSelected: (bool value) {},
                                  shape: const StadiumBorder(side: BorderSide(color: AppColors.secondColor)),
                                ),
                                FilterChip(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  label: Text("Animals", style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.white)),
                                  backgroundColor: AppColors.bgElements,
                                  onSelected: (bool value) {},
                                  shape: const StadiumBorder(side: BorderSide(color: AppColors.secondColor)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Weekly Sleep",
                          style: GoogleFonts.mulish(
                            textStyle: AppStyles.regularWhiteText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: true,
                            horizontalInterval: 1,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: AppColors.gray.withOpacity(0.5),
                                strokeWidth: 1,
                              );
                            },
                            drawVerticalLine: false,
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: AppColors.gray,
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (double value, TitleMeta meta) {
                                  // Define your hours of sleep here
                                  String text;
                                  switch (value.toInt()) {
                                    case 0:
                                      text = '4h';
                                      break;
                                    case 1:
                                      text = '5h';
                                      break;
                                    case 2:
                                      text = '6h';
                                      break;
                                    case 3:
                                      text = '7h';
                                      break;
                                    case 4:
                                      text = '8h';
                                      break;
                                    default:
                                      text = '';
                                  }
                                  return Text(text, style: GoogleFonts.mulish(
                                    textStyle: AppStyles.regularBodyWhiteText,
                                    color: AppColors.gray
                                  ));
                                },
                                interval: 1,
                                reservedSize: 15,
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, getRandomElement()),
                                FlSpot(1, getRandomElement()),
                                FlSpot(2, getRandomElement()),
                                FlSpot(3, getRandomElement()),
                                FlSpot(4, getRandomElement()),
                                FlSpot(5, getRandomElement()),
                                FlSpot(6, getRandomElement()),
                                // Add the rest of your data points here
                              ],
                              isCurved: true,
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.white,
                                  AppColors.white,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              barWidth: 1,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.bgElements,
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ],
                          minX: 0,
                          maxX: 6,
                          minY: 0,
                          maxY: 5,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

double getRandomElement() {
  final random = Random();
  double number = random.nextDouble() * 4;
  return (number * 10).round() / 10.0;
}



Future<List<DreamModel>> getDreams() async {
  return SqlDbRepository.instance.getDreams();
}
