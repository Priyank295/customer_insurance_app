import 'package:customer_insurance_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customRadioButton.dart';

class PetInsuranceScreen1 extends StatefulWidget {
  static const String petScreen1 = "/petScreen1";
  const PetInsuranceScreen1({super.key});

  @override
  State<PetInsuranceScreen1> createState() => _PetInsuranceScreen1State();
}

String radioData = '';

List<String> radioList = [
  "Dog",
  "Cat",
];

class _PetInsuranceScreen1State extends State<PetInsuranceScreen1> {
  @override
  Widget build(BuildContext context) {
    void getDataFromChild(String data) {
      setState(() {
        radioData = data;
      });
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: GestureDetector(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (ctx) => LifeInsuranceScreen2()));
          },
          child: BottomNavOneButton(context, "Next", "/petScreen2")),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: width,
            child: Column(
              children: [
                CustomPolicyAppBar(context, "Pet Insurance"),
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
                  child: SvgPicture.asset("assets/1of2.svg"),
                ),
                Container(
                  width: width,
                  padding: const EdgeInsets.symmetric(horizontal: 29.5),
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
                        height: 35,
                      ),
                      const Text(
                        'Please Select Your Pet’s Type?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          // fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomRadioButton(
                        radioValuesList: radioList,
                        callBack: getDataFromChild,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // padding: const EdgeInsets.symmetric(horizontal: 29.5),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
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
                                    color: AppColors.vectorPrimaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Add type of pet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.vectorPrimaryColor,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField(context, String name, String icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 65,
      // padding: EdgeInsets.symmetric(horizontal: 26),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          // fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          isDense: true,
          suffixIconConstraints: BoxConstraints(maxHeight: 65, maxWidth: 40),
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
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
    );
  }
}
