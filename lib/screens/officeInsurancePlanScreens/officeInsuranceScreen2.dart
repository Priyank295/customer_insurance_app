import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/customTextField.dart';

class OfficeInsuranceScreen2 extends StatefulWidget {
  static const officeScreen2 = "/officeScreen2";
  const OfficeInsuranceScreen2({super.key});

  @override
  State<OfficeInsuranceScreen2> createState() => _OfficeInsuranceScreen2State();
}

TextEditingController _floor = TextEditingController();
TextEditingController _room = TextEditingController();
TextEditingController _type = TextEditingController();
TextEditingController _age = TextEditingController();
TextEditingController _effective = TextEditingController();
TextEditingController _expiry = TextEditingController();
TextEditingController _limit = TextEditingController();
TextEditingController _building = TextEditingController();
TextEditingController _block = TextEditingController();
TextEditingController _plate = TextEditingController();
TextEditingController _plot = TextEditingController();

final formKey = GlobalKey<FormState>();
bool allValidate = true;
String selectedOption = '';

class _OfficeInsuranceScreen2State extends State<OfficeInsuranceScreen2> {
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
                    _type.text = selectedOption;

                    // isFilled = true;
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
                    _type.text = selectedOption;

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
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: 33),
          padding: const EdgeInsets.symmetric(horizontal: 26.5),
          child: InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "/officeScreen3");
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
              children: [
                CustomPolicyAppBar(context, "Office Insurance"),
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
                  child: SvgPicture.asset("assets/1of3.svg"),
                ),
                Container(
                  width: width,
                  // padding: const EdgeInsets.symmetric(horizontal: 26.5),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 26.5),
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
                        // customTextField(context, "Full Name", _fname, false),
                        CustomTextField2(
                            phone: false,
                            controller: _floor,
                            name: "No. of Floors"),
                        CustomTextField2(
                            name: "No. of Rooms",
                            controller: _room,
                            phone: false),

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
                                  controller: _type,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    // fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  // onChanged: (value) {
                                  //   if (value.length > 0) {
                                  //     setState(() {
                                  //       isFilled = true;
                                  //     });
                                  //   } else {
                                  //     setState(() {
                                  //       isFilled = false;
                                  //     });
                                  //   }
                                  // },
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
                                        "Office Type",
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
                            name: "Age of Building",
                            controller: _age,
                            phone: false),
                        CustomTextField2(
                            name: "Effective Date",
                            controller: _effective,
                            phone: false),

                        CustomTextField2(
                            name: "Expiry Date",
                            controller: _expiry,
                            phone: false),
                        CustomTextField2(
                            name: "Content Limit",
                            controller: _limit,
                            phone: false),
                        CustomTextField2(
                            name: "Building No.",
                            controller: _building,
                            phone: false),
                        CustomTextField2(
                            name: "Block No.",
                            controller: _block,
                            phone: false),
                        CustomTextField2(
                            name: "Plate No.",
                            controller: _plate,
                            phone: false),
                        CustomTextField2(
                            name: "Plot No.", controller: _plot, phone: false),
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
