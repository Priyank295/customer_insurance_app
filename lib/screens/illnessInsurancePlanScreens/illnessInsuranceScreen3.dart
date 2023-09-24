import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../common/colors.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customTextField.dart';

class IllnessInsuranceScreen3 extends StatefulWidget {
  static const String illnessScreen3 = "/illnessScreen3";
  const IllnessInsuranceScreen3({super.key});

  @override
  State<IllnessInsuranceScreen3> createState() =>
      _IllnessInsuranceScreen3State();
}

final formKey = GlobalKey<FormState>();
bool allValidate = true;
TextEditingController _policy = TextEditingController();
TextEditingController _nat = TextEditingController();
TextEditingController _dob = TextEditingController();
TextEditingController _exist = TextEditingController();
TextEditingController _limit = TextEditingController();

class _IllnessInsuranceScreen3State extends State<IllnessInsuranceScreen3> {
  Future<void> _selectDate(
      BuildContext context, TextEditingController _controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(3000),
    );
    if (picked != null) {
      setState(() {
        _controller.text = DateFormat('dd/MM/yy').format(picked);
      });
    }
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
                    Navigator.pushNamed(context, "/illnessPlansScreen");
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
                        'Critical Illness Insurance',
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
                  child: SvgPicture.asset("assets/3of3.svg"),
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
                        customTextField(
                            context, "Policyholder", _policy, false),
                        customTextField(
                            context, "National ID/Resident ID", _nat, false),
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
                                    _selectDate(context, _dob);
                                  },
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "\u24D8 Please enter ${"Birthdate".toLowerCase()} here";
                                    }
                                  },
                                  controller: _dob,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    // fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: SvgPicture.asset(
                                        "assets/calender.svg",
                                        color: Color(0xFF939EAA),
                                      ),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                        maxHeight: 60.5, maxWidth: 50),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    label: Container(
                                      child: Text(
                                        "Birthdate",
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDBE9F5),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5353),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDBE9F5),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        customTextField(
                            context, "Existing Chronic Cases", _exist, false),
                        customTextField(
                            context, "Limit of Insurance", _limit, false),
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
