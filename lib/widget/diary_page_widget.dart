import 'package:dream_diary/fake_data/model/dream_model.dart';
import 'package:dream_diary/fake_data/sql_db/SqlDbRepository.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/screens/detail_dream/detail_dream_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'bg_layout_widget.dart';

class DiaryPageWidget extends StatefulWidget {
  const DiaryPageWidget({super.key});

  @override
  State<DiaryPageWidget> createState() => DiaryPageWidgetState();
}

class DiaryPageWidgetState extends State<DiaryPageWidget> {
  TextEditingController searchController = TextEditingController();
  List<DreamModel> dreamsList = [];
  List<DreamModel> filteredDreamsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDreams();
  }

  Future<void> loadDreams() async {
    try {
      var dreams = await getDreams();
      setState(() {
        dreamsList = dreams;
        filteredDreamsList = List.from(dreamsList.reversed);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterDreams(String query) {
    final filtered = dreamsList.where((dream) {
      final titleLower = dream.title?.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower!.contains(searchLower);
    }).toList();

    setState(() {
      filteredDreamsList.clear();
      filteredDreamsList = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                      controller: searchController,
                      onChanged: filterDreams,
                      style: GoogleFonts.mulish(textStyle: AppStyles.regularBodyGreyText14, color: AppColors.gray),
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
          isLoading
              ? const CircularProgressIndicator()
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.only(top: 12),
                    itemCount: filteredDreamsList.length,
                    itemBuilder: (ctx, index) {
                      final dream = filteredDreamsList[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailDreamScreen(
                                      model: dream,
                                    ))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dream.title.toString(),
                                style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteHeading),
                              ),
                              Text(
                                getFormattedDate(dream.timestamp),
                                style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.gray),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                dream.description.toString(),
                                style:
                                    GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.gray, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 4.0,
                                children: dream.emotions!
                                    .map((tag) => FilterChip(
                                          label:
                                              Text(tag, style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.white)),
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
                    },
                  ),
                ),
          const SizedBox(height: 70)
        ],
      ),
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

String getFormattedDate(int? timestamp) {
  if (timestamp != null) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('dd.MM.yyyy').format(date);
  } else {
    return '';
  }
}
