import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

import '../../common/colors.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/mainBtn.dart';

class HomeInsuranceScreen2 extends StatefulWidget {
  static const HomeScreen2 = "/homeScreen2";
  const HomeInsuranceScreen2({super.key});

  @override
  State<HomeInsuranceScreen2> createState() => _HomeInsuranceScreen2State();
}

TextEditingController _floor = TextEditingController();
TextEditingController _room = TextEditingController();
TextEditingController _category = TextEditingController();
TextEditingController _age = TextEditingController();
TextEditingController _effective = TextEditingController();
TextEditingController _expiry = TextEditingController();
TextEditingController _limit = TextEditingController();
final formKey = GlobalKey<FormState>();
bool a = false, b = false, c = false;
String selectedOption = '';

class _HomeInsuranceScreen2State extends State<HomeInsuranceScreen2> {
  Future<void> _selectDate(
      BuildContext context, TextEditingController _controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(2010),
      lastDate: DateTime(3000),
    );
    if (picked != null) {
      setState(() {
        _controller.text = DateFormat('dd/MM/yy').format(picked);
        _expiry.text =
            DateFormat('dd/MM/yy').format(picked.add(Duration(days: 365)));
      });
    }
  }

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
                title: Text('Rented'),
                value: 'Rented',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                    _category.text = selectedOption;

                    print(selectedOption);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Owned'),
                value: 'Owned',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                    _category.text = selectedOption;

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
                  Navigator.pushNamed(context, "/homeScreen3");
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: width,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPolicyAppBar(context, "Home Insurance"),
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
                  // padding: const EdgeInsets.symmetric(horizontal: 26.5),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26.5),
                          child: Column(
                            children: [
                              Text(
                                'We need some more info. of yours',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Do not worry! Your details are completely safe here!',
                                style: TextStyle(
                                  color: Color(0xFF939EAA),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextField2(
                            name: "No. of floors",
                            controller: _floor,
                            phone: true),
                        CustomTextField2(
                            name: "No. of rooms",
                            controller: _room,
                            phone: true),
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
                                    showRadioDailog(context);
                                  },
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "\u24D8 Please enter ${"Category".toLowerCase()} here";
                                    }
                                  },
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        a = true;
                                      });
                                    } else {
                                      setState(() {
                                        a = false;
                                      });
                                    }
                                  },
                                  controller: _category,
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
                                        "Home Category",
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
                                          color: isFilled
                                              ? AppColors.filledTextFieldColor
                                              : AppColors.regularTextFieldColor,
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
                        customTextField(context, "Age of building", _age, true),
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
                                    _selectDate(context, _effective);
                                  },
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "\u24D8 Please enter ${"Effective date".toLowerCase()} here";
                                    }
                                  },
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        b = true;
                                      });
                                    } else {
                                      setState(() {
                                        b = false;
                                      });
                                    }
                                  },
                                  controller: _effective,
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
                                        "Effective Date",
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
                                          color: isFilled
                                              ? AppColors.filledTextFieldColor
                                              : AppColors.regularTextFieldColor,
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
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "\u24D8 Please enter ${"Expiry Date".toLowerCase()} here";
                                    }
                                  },
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        c = true;
                                      });
                                    } else {
                                      setState(() {
                                        c = false;
                                      });
                                    }
                                  },
                                  controller: _expiry,
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
                                        "Expiry Date",
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
                                          color: isFilled
                                              ? AppColors.filledTextFieldColor
                                              : AppColors.regularTextFieldColor,
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
                        CustomTextField2(
                            name: "Content limit",
                            controller: _limit,
                            phone: false),
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

  // Widget customTextField(context, String name, String icon) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     width: MediaQuery.of(context).size.width,
  //     height: 65,
  //     padding: EdgeInsets.symmetric(horizontal: 26),
  //     child: TextFormField(
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontSize: 18,
  //         // fontFamily: 'Nunito',
  //         fontWeight: FontWeight.w700,
  //       ),
  //       decoration: InputDecoration(
  //         isDense: true,
  //         suffixIconConstraints: BoxConstraints(maxHeight: 65, maxWidth: 40),
  //         suffixIcon: icon.length != 0
  //             ? Container(
  //                 width: 100,
  //                 height: 65,
  //                 child: Center(
  //                   child: SvgPicture.asset(
  //                     icon,
  //                     color: Color(0xFF939EAA),
  //                   ),
  //                 ),
  //               )
  //             : null,
  //         contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  //         label: Container(
  //           child: Text(
  //             name,
  //             style: GoogleFonts.nunito(
  //               color: Color(0xFF939EAA),
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               color: Color(0xFFDBE9F5),
  //               width: 1,
  //             ),
  //             borderRadius: BorderRadius.circular(10)),
  //         focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               color: Color(0xff008EFF),
  //               width: 0.5,
  //             ),
  //             borderRadius: BorderRadius.circular(10)),
  //       ),
  //     ),
  //   );
  // }
}
