import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/CustomAppbar.dart';
import '../../widgets/bottom_nav_button.dart';

class MarineInsuranceScreen2 extends StatefulWidget {
  static const String marineScreen2 = "/marineScreen2";
  const MarineInsuranceScreen2({super.key});

  @override
  State<MarineInsuranceScreen2> createState() => _MarineInsuranceScreen2State();
}

final formKey = GlobalKey<FormState>();
bool allValidate = true;

class _MarineInsuranceScreen2State extends State<MarineInsuranceScreen2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar:
          BottomNavOneButton(context, "Next", "/marineScreen3"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomPolicyAppBar(context, "Marine Insurance"),
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
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 26.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Before we proceed, \nWe need some details of yours',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: formKey,
                child:
                    customTextField(context, "Select", "assets/downBlack.svg"),
              ),
            ],
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
      padding: EdgeInsets.symmetric(horizontal: 26),
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
