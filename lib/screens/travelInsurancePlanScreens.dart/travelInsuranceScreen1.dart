import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customRadioButton.dart';
import '../../widgets/mainBtn.dart';
import '../LifeInsurancePlanScreens/lifeInsuranceScreen2.dart';
import '../LifeInsurancePlanScreens/lifeInsuranceScreen2IfFamily.dart';
import 'travelInsuranceScreen2.dart';
import 'travelInsuranceScreen2IfFamily.dart';

class TravelInsuranceScreen1 extends StatefulWidget {
  static const String travelInsurance = '/travelInsurance';
  const TravelInsuranceScreen1({super.key});

  @override
  State<TravelInsuranceScreen1> createState() => _TravelInsuranceScreen1State();
}

String radioData = '';

class _TravelInsuranceScreen1State extends State<TravelInsuranceScreen1> {
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
      backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
          onTap: () {
            radioData == "Family"
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => TravelInsuranceScreen2IfFamily()))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => TravelInsuranceScreen2()));
          },
          child: BottomNavOneButton(context, "Next", "")),
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
                        'Travel Insurance',
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
                    child: SvgPicture.asset("assets/1of3.svg")),
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
                        'Who would you like to Insure?',
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
                        radioValuesList: const ["Self", "Family"],
                        callBack: getDataFromChild,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     radioData == "All Family"
                      //         ? Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (ctx) =>
                      //                     LifeInsuranceScreen2IfFamily()))
                      //         : Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (ctx) =>
                      //                     LifeInsuranceScreen2()));
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) =>
                      //     //             MedicalInsuranceScreen2IfFamily()));
                      //   },
                      //   child: Container(
                      //       margin: EdgeInsets.symmetric(vertical: 33),
                      //       padding: EdgeInsets.symmetric(horizontal: 26),
                      //       child: MainButton(context, "Next")),
                      // )
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
