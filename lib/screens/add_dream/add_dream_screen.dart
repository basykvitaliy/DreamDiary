import 'package:dream_diary/fake_data/fake_list.dart';
import 'package:dream_diary/fake_data/model/dream_model.dart';
import 'package:dream_diary/fake_data/sql_db/SqlDbRepository.dart';
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/helpers/constants.dart';
import 'package:dream_diary/widget/button_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDreamScreen extends StatefulWidget {
  const AddDreamScreen({super.key});

  @override
  State<AddDreamScreen> createState() => _AddDreamScreenState();
}

class _AddDreamScreenState extends State<AddDreamScreen> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  String dropdownKeyMomentsValue = 'Flying or Falling';
  String dropdownEmotionsValue = 'Flying or Falling';
  String dropdownCharactersValue = 'Flying or Falling';
  final List<String> selectedEmotions = [];
  final FocusNode _focusNode = FocusNode();

  bool isTitle(String input) => input.isNotEmpty;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
            Form(
              key: formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColors.gray,
                            ))
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: controllerTitle,
                        validator: (value) {
                          if (!isTitle(value!)) {
                            return 'Please enter the title';
                          }
                          return null;
                        },
                        style: GoogleFonts.epilogue(
                          textStyle: AppStyles.boldWhiteHeading,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: GoogleFonts.epilogue(
                            textStyle: AppStyles.boldWhiteHeading,
                          ),
                          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.white, width: 1)),
                          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.white, width: 1)),
                          border: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.white, width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Sleep time",
                      style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: controller,
                        onTap: () {
                          DatePicker.showTimePicker(context, showTitleActions: true, showSecondsColumn: false, onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            controller.text = "${date.hour.toString().padLeft(2, '0')} : ${date.minute.toString().padLeft(2, '0')}";
                            print('confirm $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                        readOnly: true,
                        style: GoogleFonts.epilogue(
                          textStyle: AppStyles.regularMainText16,
                          color: AppColors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "00.00",
                          hintStyle: GoogleFonts.mulish(textStyle: AppStyles.regularBodyGreyText14, color: AppColors.gray),
                          filled: true,
                          fillColor: AppColors.bgElements,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Describe what you’ve seen",
                      style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: controller2,
                        maxLines: 10,
                        minLines: 3,
                        style: GoogleFonts.epilogue(
                          textStyle: AppStyles.regularMainText16,
                          color: AppColors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter the describe";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Start typing...",
                          hintStyle: GoogleFonts.mulish(textStyle: AppStyles.regularBodyGreyText14, color: AppColors.gray),
                          filled: true,
                          fillColor: AppColors.bgElements,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Key Moments",
                      style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: AppColors.bgElements,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      isExpanded: true,
                      hint: Text("Moments",
                          style: GoogleFonts.epilogue(
                            textStyle: AppStyles.regularWhiteText,
                            color: AppColors.white,
                          )),
                      items: keyMomentsList
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: GoogleFonts.epilogue(
                                      textStyle: AppStyles.regularWhiteText,
                                    )),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return "Select Moments";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        dropdownKeyMomentsValue = value.toString();
                      },
                      onSaved: (value) {
                        //selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 50,
                        padding: EdgeInsets.only(right: 10),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.white,
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.bgElements),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Emotions",
                      style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        focusNode: _focusNode,
                        controller: controller3,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Select emotions";
                          }
                          return null;
                        },
                        onTap: () {
                          _focusNode.unfocus();
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return AlertDialog(
                                    title: Text(
                                      'Emotions',
                                      style: GoogleFonts.mulish(textStyle: AppStyles.regularWhite22, ),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: emotionsList.map((emotion) {
                                          return CheckboxListTile(
                                            title: Text(
                                              emotion,
                                              style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText, color: AppColors.white),
                                            ),
                                            value: selectedEmotions.contains(emotion),
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                if (newValue != null) {
                                                  if (newValue) {
                                                    selectedEmotions.add(emotion);
                                                    controller3.text = selectedEmotions.join(", ");
                                                  } else {
                                                    selectedEmotions.remove(emotion);
                                                    controller3.text = selectedEmotions.join(", ");
                                                  }
                                                }
                                              });
                                            },
                                            activeColor: AppColors.secondColor,
                                            contentPadding: EdgeInsets.zero,
                                            controlAffinity: ListTileControlAffinity.leading,
                                            checkboxShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    backgroundColor: AppColors.bgElements,
                                  );
                                },
                              );
                            },
                          );
                        },
                        readOnly: true,
                        style: GoogleFonts.epilogue(
                          textStyle: AppStyles.regularMainText16,
                          color: AppColors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "Emotions",
                          hintStyle: GoogleFonts.mulish(textStyle: AppStyles.regularBodyGreyText14, color: AppColors.white),
                          filled: true,
                          fillColor: AppColors.bgElements,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Characters",
                      style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: AppColors.bgElements,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      isExpanded: true,
                      hint: Text("Characters",
                          style: GoogleFonts.epilogue(
                            textStyle: AppStyles.regularWhiteText,
                            color: AppColors.white,
                          )),
                      items: caractersList
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: GoogleFonts.epilogue(
                                      textStyle: AppStyles.regularWhiteText,
                                      color: AppColors.white,
                                    )),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return "Select characters";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        dropdownCharactersValue = value.toString();
                      },
                      onSaved: (value) {
                        //selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 50,
                        padding: EdgeInsets.only(right: 10),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.white,
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.bgElements),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonWidget(
        title: "Complete",
        isDisabledBtn: false,
        onTap: () async {
          if (formKey.currentState!.validate()) {
            var model = DreamModel(
                title: controllerTitle.text,
                sleepTime: controller.text,
                description: controller2.text,
                moments: dropdownKeyMomentsValue,
                emotions: selectedEmotions,
                characters: dropdownCharactersValue,
                timestamp: DateTime.now().millisecondsSinceEpoch);
            await insertDream(model);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

Future<Status> insertDream(DreamModel model) {
  return SqlDbRepository.instance.insertDream(model);
}
