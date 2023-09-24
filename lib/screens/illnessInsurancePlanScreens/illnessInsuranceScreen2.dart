import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/bottom_nav_button.dart';

class IllnessInsuranceScreen2 extends StatefulWidget {
  static const illnessScreen2 = "/illnessScreen2";
  const IllnessInsuranceScreen2({super.key});

  @override
  State<IllnessInsuranceScreen2> createState() =>
      _IllnessInsuranceScreen2State();
}

final formKey = GlobalKey<FormState>();
bool allValidate = true;
TextEditingController controller = TextEditingController();
String selectedOption = '';

List<String> suggestions = [
  'Stroke',
  'Major Cancer',
  'Heart Attack',
  'Kidney Failure',
  'Deafness (Loss of Hearing)',
  'Alzheimer',
  'Loss of Speech',
  'Poliomyelitis',
  'Blindness',
  'Brain Tumor',
  'Parkinson’s Disease',
  'Paralysis',
  'Encephalitis',
];

TextEditingController _conditions = TextEditingController();

List<String> selectedSuggestions = [];

class _IllnessInsuranceScreen2State extends State<IllnessInsuranceScreen2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void showRadioDailog(context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Text('Select an option'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  title: Text('Yes'),
                  value: 'Yes',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value.toString();
                      controller.text = selectedOption;
                      print(selectedOption);
                    });
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: 'No',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value.toString();
                      controller.text = selectedOption;
                      print(selectedOption);
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: 33),
          padding: const EdgeInsets.symmetric(horizontal: 26.5),
          child: InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "/illnessScreen3");
                } else {
                  setState(() {
                    allValidate = false;
                  });
                }
              },
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 26.5, vertical: 33),
                width: MediaQuery.of(context).size.width,
                height: 55,
                decoration: ShapeDecoration(
                  gradient: allValidate
                      ? AppColors.primaryGradient
                      : AppColors.secondaryGradient,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ))),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              children: [
                CustomPolicyAppBar(context, "Critical Illness Insurance"),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.8,
                  width: width,
                  color: Color(0xFFDBE9F5),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 19.5),
                  child: SvgPicture.asset("assets/2of3.svg"),
                ),
                Container(
                  width: width,
                  // height: height,
                  padding: const EdgeInsets.symmetric(horizontal: 29.5),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Before we proceed, \nWe need some details of yours',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          constraints: BoxConstraints(minHeight: 65),
                          // padding: EdgeInsets.symmetric(horizontal: 26),
                          child: TextFormField(
                            keyboardType: TextInputType.none,
                            showCursor: false,
                            controller: controller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "\u24D8 Select this field";
                              }
                            },
                            onTap: () {
                              showRadioDailog(context);
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              // fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: InputDecoration(
                              suffixIconConstraints:
                                  BoxConstraints(maxHeight: 65, maxWidth: 40),
                              suffixIcon: Container(
                                width: 100,
                                height: 65,
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/downBlack.svg",
                                    color: Color(0xFF939EAA),
                                  ),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              label: Container(
                                child: Text(
                                  "Any Previous Medical History?",
                                  style: GoogleFonts.nunito(
                                    color: Color(0xFF939EAA),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              errorStyle: TextStyle(
                                color: Color(0xFFFF5353),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF5353),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE9F5),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF5353),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE9F5),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        selectedOption == 'Yes'
                            ? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    width: MediaQuery.of(context).size.width,
                                    // height: 65,
                                    // padding: EdgeInsets.symmetric(horizontal: 26),
                                    child: TextFormField(
                                      maxLines: 3,
                                      // expands: true,
                                      keyboardType: TextInputType.multiline,

                                      maxLength: 100,

                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        // fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                      ),
                                      decoration: InputDecoration(
                                        isDense: true,
                                        suffixIconConstraints: BoxConstraints(
                                            maxHeight: 65, maxWidth: 40),
                                        suffixIcon: "".length != 0
                                            ? Container(
                                                width: 100,
                                                height: 65,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "assets/downBlack.svg",
                                                    color: Color(0xFF939EAA),
                                                  ),
                                                ),
                                              )
                                            : null,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        label: Container(
                                          child: Text(
                                            "Please Describe in Detail",
                                            style: GoogleFonts.nunito(
                                              color: Color(0xFF939EAA),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE9F5),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xff008EFF),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      width: MediaQuery.of(context).size.width,
                                      height: 65,
                                      // padding: EdgeInsets.symmetric(horizontal: 26),

                                      child: Form(
                                        child: TypeAheadFormField(
                                          keepSuggestionsOnSuggestionSelected:
                                              true,
                                          hideKeyboard: true,
                                          suggestionsBoxDecoration:
                                              SuggestionsBoxDecoration(
                                            color: Colors.white,
                                          ),
                                          textFieldConfiguration:
                                              TextFieldConfiguration(
                                            controller: _conditions,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              // fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w700,
                                            ),
                                            decoration: InputDecoration(
                                              isDense: true,
                                              suffixIconConstraints:
                                                  BoxConstraints(
                                                      maxHeight: 65,
                                                      maxWidth: 40),
                                              // suffixIcon:  Container(
                                              //         width: 100,
                                              //         height: 65,
                                              //         child: Center(
                                              //           child: SvgPicture.asset(
                                              //             icon,
                                              //             color: Color(0xFF939EAA),
                                              //           ),
                                              //         ),
                                              //       )

                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 20),
                                              label: Container(
                                                child: Text(
                                                  "Pre-Existing Condition",
                                                  style: GoogleFonts.nunito(
                                                    color: Color(0xFF939EAA),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE9F5),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xff008EFF),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                          suggestionsCallback: (pattern) {
                                            return suggestions.where((fruit) =>
                                                fruit.toLowerCase().contains(
                                                    pattern.toLowerCase()));
                                          },
                                          itemBuilder:
                                              (context, String suggestion) {
                                            return ListTile(
                                              tileColor: Colors.transparent,
                                              style: ListTileStyle.list,
                                              leading: CustomCheckBox(
                                                value: selectedSuggestions
                                                    .contains(suggestion),
                                                shouldShowBorder: true,
                                                borderColor: Color(0xff00A3FF),
                                                checkedFillColor:
                                                    Color(0xff00A3FF),
                                                borderRadius: 2,
                                                borderWidth: 1,
                                                checkBoxSize: 16,
                                                onChanged: (val) {
                                                  setState(() {
                                                    if (val) {
                                                      selectedSuggestions
                                                          .add(suggestion);
                                                    } else {
                                                      selectedSuggestions
                                                          .remove(suggestion);
                                                    }
                                                  });
                                                },
                                              ),
                                              title: Text(
                                                suggestion,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  // fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            );
                                          },
                                          onSuggestionSelected:
                                              (String suggestion) {
                                            setState(() {
                                              selectedSuggestions
                                                  .add(suggestion);
                                            });
                                          },
                                        ),
                                      )),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
