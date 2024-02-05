import 'package:dream_diary/fake_data/fake_list.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bg_layout_widget.dart';

class DreamPageWidget extends StatefulWidget {
  const DreamPageWidget({super.key});

  @override
  State<DreamPageWidget> createState() => _DreamPageWidgetState();
}

class _DreamPageWidgetState extends State<DreamPageWidget> {

  TextEditingController searchController = TextEditingController();
  List<String> filteredKeyMomentsList = [];
  List<String> filteredInterpretationsList = [];

  @override
  void initState() {
    super.initState();
    filteredKeyMomentsList = List.from(keyMomentsList);
    filteredInterpretationsList = List.from(keyMomentsInterpretationsList);
  }

  void filterSearchResults(String query) {
    List<String> tempSearchList = [];
    List<String> tempSearchInterpretationsList = [];
    if(query.isNotEmpty) {
      for (int i = 0; i < keyMomentsList.length; i++) {
        if (keyMomentsList[i].toLowerCase().contains(query.toLowerCase())) {
          tempSearchList.add(keyMomentsList[i]);
          tempSearchInterpretationsList.add(keyMomentsInterpretationsList[i]);
        }
      }
      setState(() {
        filteredKeyMomentsList = tempSearchList;
        filteredInterpretationsList = tempSearchInterpretationsList;
      });
    } else {
      setState(() {
        filteredKeyMomentsList = List.from(keyMomentsList);
        filteredInterpretationsList = List.from(keyMomentsInterpretationsList);
      });
    }
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
                      onChanged: filterSearchResults,
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
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: filteredKeyMomentsList.length,
              itemBuilder: (context, index){
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filteredKeyMomentsList[index].toString(),
                        style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteHeading),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        filteredInterpretationsList[index],
                        style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.gray),
                      ),
                    ],
                  ),
                );
          }),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
