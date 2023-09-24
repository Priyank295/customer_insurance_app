import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../common/colors.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/mainBtn.dart';

class LifeInsuranceScreen2 extends StatefulWidget {
  static const LifeScreen2 = "/lifeScreen2";
  const LifeInsuranceScreen2({super.key});

  @override
  State<LifeInsuranceScreen2> createState() => _LifeInsuranceScreen2State();
}

TextEditingController _policy = TextEditingController();
TextEditingController _dob = TextEditingController();
TextEditingController _exist = TextEditingController();
TextEditingController _any = TextEditingController();
TextEditingController _nat = TextEditingController();
TextEditingController _amount = TextEditingController();
String selectedOption = '';
final formKey = GlobalKey<FormState>();

class _LifeInsuranceScreen2State extends State<LifeInsuranceScreen2> {
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

  bool allValidate = true;
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
                      _any.text = selectedOption;
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
                      _any.text = selectedOption;
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
                    Navigator.pushNamed(context, "/lifePlansScreen");
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
                CustomPolicyAppBar(context, "Life Insurance"),
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
                          padding: const EdgeInsets.symmetric(horizontal: 29),
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
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
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
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 29),
                          height: 65,
                          // padding: EdgeInsets.symmetric(horizontal: 26),
                          child: TextFormField(
                            keyboardType: TextInputType.none,
                            showCursor: false,
                            controller: _any,
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
                              isDense: true,
                              suffixIconConstraints:
                                  BoxConstraints(maxHeight: 65, maxWidth: 40),
                              suffixIcon: "assets/downBlack.svg".length != 0
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
                                  "Any previous medical Cases?",
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
                        ),
                        selectedOption == 'Yes'
                            ? Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width,
                                // height: 65,
                                padding: EdgeInsets.symmetric(horizontal: 26.5),
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
                        customTextField(
                            context, "National ID/Resident ID", _nat, false),
                        customTextField(
                            context, "Insurance Amount", _amount, false)
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
