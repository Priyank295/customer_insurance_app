import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customTextField.dart';

class PetInsuranceScreen2 extends StatefulWidget {
  static const String petScreen2 = "/petScreen2";
  const PetInsuranceScreen2({super.key});

  @override
  State<PetInsuranceScreen2> createState() => _PetInsuranceScreen2State();
}

TextEditingController _owner = TextEditingController();
TextEditingController _pet = TextEditingController();
TextEditingController _age = TextEditingController();
TextEditingController _gender = TextEditingController();
TextEditingController _via = TextEditingController();
TextEditingController _color = TextEditingController();
TextEditingController _exist = TextEditingController();
final formKey = GlobalKey<FormState>();
bool allValidate = true;

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

class _PetInsuranceScreen2State extends State<PetInsuranceScreen2> {
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
                title: Text('Male'),
                value: 'Male',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                    _gender.text = selectedOption;
                    print(selectedOption);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Female'),
                value: 'Female',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                    _gender.text = selectedOption;
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 33),
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 55,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFDBE9F5)),
                    borderRadius: BorderRadius.circular(27.50),
                  ),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    "assets/edit.svg",
                    color: AppColors.vectorPrimaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Edit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFEF7C00),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "/petPlansScreen");
                  } else {
                    setState(() {
                      allValidate = false;
                    });
                  }
                },
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 26),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    decoration: ShapeDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: width,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 44, left: 29),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset("assets/back.svg")),
                      const SizedBox(
                        width: 25,
                      ),
                      const Text(
                        'Pet Insurance',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  child: SvgPicture.asset("assets/2of2.svg"),
                ),
                Container(
                  width: width,
                  // padding: const EdgeInsets.symmetric(horizontal: 26.5),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26.5),
                          child: Text(
                            'Before we proceed, \nWe need some details of yours',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        customTextField(context, "Owner’s Name", _owner, false),
                        customTextField(context, "Pet’s Name", _pet, false),
                        customTextField(context, "Age", _age, true),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          constraints: BoxConstraints(minHeight: 60),
                          padding: EdgeInsets.symmetric(horizontal: 26.5),
                          child: TextFormField(
                            keyboardType: TextInputType.none,
                            showCursor: false,
                            controller: _gender,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "\u24D8 Select your gender";
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
                                  "Gender",
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
                        customTextField(context, "Color", _color, false),
                        customTextField(
                            context, "Pre-Existing Conditions", _exist, false),
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
