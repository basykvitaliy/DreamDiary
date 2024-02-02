import 'package:dream_diary/fake_data/model/dream_model.dart';
import 'package:dream_diary/fake_data/sql_db/SqlDbRepository.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/screens/detail_dream/detail_dream_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bg_layout_widget.dart';

class DiaryPageWidget extends StatefulWidget {
  const DiaryPageWidget({super.key});

  @override
  State<DiaryPageWidget> createState() => _DiaryPageWidgetState();
}

class _DiaryPageWidgetState extends State<DiaryPageWidget> {
  List<DreamModel> list = List<DreamModel>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            BgLayoutWidget(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/search.svg')),
                const SizedBox(width: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.mulish(textStyle: AppStyles.regularBodyGreyText14, color: AppColors.gray),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        FutureBuilder(
            future: getDreams(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Помилка: ${snapshot.error}'));
              } else {
                var dreamsList = snapshot.data as List<DreamModel>;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: dreamsList.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailDreamScreen(model: dreamsList[index],))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dreamsList[index].title.toString(),
                                style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteHeading),
                              ),
                              Text(
                                dreamsList[index].sleepTime.toString(),
                                style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.gray),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                dreamsList[index].description.toString(),
                                style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.gray, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 4.0,
                                children: dreamsList[index]
                                    .emotions!
                                    .map((tag) => FilterChip(
                                          label: Text(tag, style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.white)),
                                          backgroundColor: AppColors.bgElements,
                                          onSelected: (bool value) {},
                                          shape: const StadiumBorder(side: BorderSide(color: AppColors.secondColor)),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
            })
      ],
    );
  }
}

Future<List<String>> getSuggestions(String pattern) async {
  List<String> matches = [];
  return matches;
}

Future<List<DreamModel>> getDreams() async {
  return SqlDbRepository.instance.getDreams();
}
