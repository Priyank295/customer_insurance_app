import 'package:custom_check_box/custom_check_box.dart';
import 'package:customer_insurance_app/screens/medicalInsurancePlanScreens/medicalInsuranceScreen3.dart';
import 'package:customer_insurance_app/screens/medicalInsurancePlanScreens/medicalInsuranceScreen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../common/colors.dart';
import '../../models/medical.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/mainBtn.dart';
import 'medicalInsuranceScreen1.dart';

class MedicalInsuranceScreen2IfFamily extends StatefulWidget {
  static const MedicalScreen2 = "/medicalScreen2";
  final Medical medical;
  MedicalInsuranceScreen2IfFamily({required this.medical});

  @override
  State<MedicalInsuranceScreen2IfFamily> createState() =>
      _MedicalInsuranceScreen2IfFamilyState();
}

int familyFields = 1;

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

List<TextEditingController> nameList = [
  TextEditingController(),
];
List<TextEditingController> dobList = [
  TextEditingController(),
];
List<TextEditingController> conList = [
  TextEditingController(),
];

List<Family> rowData = [];

TextEditingController _conditions = TextEditingController();

List<String> selectedSuggestions = [];
final formKey = GlobalKey<FormState>();

class _MedicalInsuranceScreen2IfFamilyState
    extends State<MedicalInsuranceScreen2IfFamily> {
  Future<void> _selectDate(
      BuildContext context, TextEditingController _controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2004),
      firstDate: DateTime(1950),
      lastDate: DateTime(2004),
    );
    if (picked != null) {
      setState(() {
        _controller.text = DateFormat('dd/MM/yy').format(picked);
      });
    }
  }

  List<Widget> getWidgets(int count) {
    setState(() {
      nameList.add(TextEditingController());
      dobList.add(TextEditingController());
      conList.add(TextEditingController());
    });

    return List.generate(count, (_) => familyDetailsWidgets(context, _));
  }

  bool allValidate = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: 33),
          padding: const EdgeInsets.symmetric(horizontal: 26.5),
          child: InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  for (int i = 0; i < nameList.length; i++) {
                    rowData.add(
                        Family(name: nameList[i].text, dob: dobList[i].text));
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => MedicalInsuranceScreen3(
                        medical: Medical(
                            age: widget.medical.age,
                            individualType: widget.medical.individualType,
                            row: rowData),
                      ),
                    ),
                  );
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: width,
            child: Column(
              children: [
                CustomPolicyAppBar(context, "Individual Medical Insurance"),
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
                  // padding: const EdgeInsets.symmetric(horizontal: 29.5),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 29.5),
                          child: const Text(
                            'Before we proceed, \nWe need some details of yours',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        Column(
                          children: getWidgets(familyFields),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 29.5),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  familyFields++;
                                });
                              },
                              child: Container(
                                width: 170,
                                height: 35,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color(0xFFEF7C00),
                                    ),
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Add Another Member',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFEF7C00),
                                      fontSize: 14,
                                      // fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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

  Widget CustomTypeheadTextField(
      context, String name, String icon, TextEditingController _controller) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 29.5),
        width: MediaQuery.of(context).size.width,
        height: 65,
        // padding: EdgeInsets.symmetric(horizontal: 26),

        child: Form(
          child: TypeAheadFormField(
            keepSuggestionsOnSuggestionSelected: true,
            hideKeyboard: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "\u24D8 Please select ${"conditions".toLowerCase()} here";
              }
            },
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              color: Colors.white,
            ),
            textFieldConfiguration: TextFieldConfiguration(
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
                    BoxConstraints(maxHeight: 65, maxWidth: 40),
                suffixIcon: icon.length != 0
                    ? Container(
                        width: 100,
                        height: 65,
                        child: Center(
                          child: SvgPicture.asset(
                            icon,
                            color: Color(0xFF939EAA),
                          ),
                        ),
                      )
                    : null,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                label: Container(
                  child: Text(
                    name,
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
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff008EFF),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            suggestionsCallback: (pattern) {
              return suggestions.where((fruit) =>
                  fruit.toLowerCase().contains(pattern.toLowerCase()));
            },
            itemBuilder: (context, String suggestion) {
              return ListTile(
                tileColor: Colors.transparent,
                style: ListTileStyle.list,
                leading: CustomCheckBox(
                  value: selectedSuggestions.contains(suggestion),
                  shouldShowBorder: true,
                  borderColor: Color(0xff00A3FF),
                  checkedFillColor: Color(0xff00A3FF),
                  borderRadius: 2,
                  borderWidth: 1,
                  checkBoxSize: 16,
                  onChanged: (val) {
                    setState(() {
                      if (val) {
                        selectedSuggestions.add(suggestion);
                      } else {
                        selectedSuggestions.remove(suggestion);
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
            onSuggestionSelected: (String suggestion) {
              setState(() {
                selectedSuggestions.add(suggestion);
              });
            },
          ),
        ));
  }

  Widget familyDetailsWidgets(context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        familyFields > 1
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.5),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        familyFields--;
                      });
                    },
                    child: SvgPicture.asset("assets/close3.svg")),
              )
            : Container(),
        customTextField(
          context,
          "Name",
          nameList[index],
          false,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 26),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(minHeight: 65),
                child: TextFormField(
                  onTap: () {
                    _selectDate(context, dobList[index]);
                  },
                  keyboardType: TextInputType.none,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "\u24D8 Please enter ${"Birthdate".toLowerCase()} here";
                    }
                  },
                  controller: dobList[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    // fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    label: Container(
                      child: Text(
                        "Birthdate (DD/MM/YYYY)*",
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
            ],
          ),
        ),
        CustomTypeheadTextField(context, "Pre-Existing Condition",
            "assets/downBlack.svg", conList[index]),
      ],
    );
  }
}
