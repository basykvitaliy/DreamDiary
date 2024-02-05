import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  String formattedDate = "";

  @override
  void initState() {
    var date = DateTime.now();
    formattedDate = DateFormat('dd MMMM').format(date);
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
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.more_vert, color: AppColors.white),
                        )
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
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
                            "9h 45m",
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
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
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
                    Container(
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
                              spots: const [
                                FlSpot(0, 3),
                                FlSpot(1, 2),
                                FlSpot(2, 4),
                                FlSpot(3, 3),
                                FlSpot(6, 4),
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
