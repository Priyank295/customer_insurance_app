import 'package:customer_insurance_app/screens/editProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../common/colors.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/mainBtn.dart';

class MedicalInsuranceScreen4 extends StatefulWidget {
  static const MedicalScreen4 = "/medicalScreen4";
  const MedicalInsuranceScreen4({super.key});

  @override
  State<MedicalInsuranceScreen4> createState() =>
      _MedicalInsuranceScreen4State();
}

TextEditingController _any = TextEditingController();
TextEditingController _gender = TextEditingController();
TextEditingController _policy = TextEditingController();
TextEditingController _nat = TextEditingController();
TextEditingController _id = TextEditingController();
TextEditingController _dob = TextEditingController();
String selectedOption1 = '';
String selectedOption2 = '';
final formKey = GlobalKey<FormState>();
bool allValidate = true;
DateTime selectedDate = DateTime.now();

class _MedicalInsuranceScreen4State extends State<MedicalInsuranceScreen4> {
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2004),
      firstDate: DateTime(1980),
      lastDate: DateTime(2004),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void showRadioDailog1(
      context,
    ) {
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
                  groupValue: selectedOption1,
                  onChanged: (value) {
                    setState(() {
                      selectedOption1 = value.toString();
                      _any.text = selectedOption1;
                      print(selectedOption1);
                    });
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: 'No',
                  groupValue: selectedOption1,
                  onChanged: (value) {
                    setState(() {
                      selectedOption1 = value.toString();
                      _any.text = selectedOption1;
                      print(selectedOption1);
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

    void showRadioDailog2(
      context,
    ) {
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
                  groupValue: selectedOption2,
                  onChanged: (value) {
                    setState(() {
                      selectedOption2 = value.toString();
                      _gender.text = selectedOption2;
                      print(selectedOption2);
                    });
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text('Female'),
                  value: 'Female',
                  groupValue: selectedOption2,
                  onChanged: (value) {
                    setState(() {
                      selectedOption2 = value.toString();
                      _gender.text = selectedOption2;
                      print(selectedOption2);
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
      backgroundColor: Colors.white,
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
                      color: AppColors.vectorPrimaryColor,
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
                    Navigator.pushNamed(context, "/medicalPlansScreen");
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                  child: SvgPicture.asset("assets/3of3.svg"),
                ),
                Container(
                  width: width,
                  // height: height,
                  // padding: const EdgeInsets.symmetric(horizontal: 29.5),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 26.5),
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
                          height: 25,
                        ),
                        customTextField(
                            context, "Policyholder*", _policy, false),
                        customTextField(
                            context, "National ID No*", _nat, false),
                        customTextField(context, "ID No.*", _id, false),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 26),
                          margin: EdgeInsets.symmetric(vertical: 7.5),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                constraints: BoxConstraints(minHeight: 65),
                                child: TextFormField(
                                  onTap: () {
                                    _selectDate(context, _dob);
                                  },
                                  controller: _dob,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    // fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    label: Container(
                                      child: Text(
                                        "Date Of Birth*",
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
                                          color:
                                              AppColors.regularTextFieldColor,
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
                                          color: AppColors.focusTextFieldColor,
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
                                    showRadioDailog2(context);
                                  },
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "\u24D8 Please select ${"this".toLowerCase()} option";
                                    }
                                  },
                                  controller: _gender,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    // fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIconConstraints: BoxConstraints(
                                        maxHeight: 65, maxWidth: 40),
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
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    label: Container(
                                      child: Text(
                                        "Gender*",
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
                                    showRadioDailog1(context);
                                  },
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "\u24D8 Please select ${"this".toLowerCase()} option";
                                    }
                                  },
                                  controller: _any,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    // fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIconConstraints: BoxConstraints(
                                        maxHeight: 65, maxWidth: 40),
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
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    label: Container(
                                      child: Text(
                                        "Any Previous Medical Insurance?",
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
                        selectedOption1 == 'Yes'
                            ? Container(
                                padding: EdgeInsets.symmetric(horizontal: 26),
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
