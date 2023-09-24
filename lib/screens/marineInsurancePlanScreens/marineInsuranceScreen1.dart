import 'package:customer_insurance_app/models/marine.dart';
import 'package:customer_insurance_app/screens/marineInsurancePlanScreens/marineInsuranceScreen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customTextField.dart';

class MarineInsuranceScreen1 extends StatefulWidget {
  static const String marineScreen1 = "/marineScreen1";
  const MarineInsuranceScreen1({super.key});

  @override
  State<MarineInsuranceScreen1> createState() => _MarineInsuranceScreen1State();
}

final formKey = GlobalKey<FormState>();
bool allValidate = true;
TextEditingController _phone = TextEditingController();

class _MarineInsuranceScreen1State extends State<MarineInsuranceScreen1> {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => MarineInsuranceScreen2(
                              Marine(mobileNo: _phone.text))));
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
                child: SvgPicture.asset("assets/1of3.svg"),
              ),
              Container(
                width: width,
                // padding: const EdgeInsets.symmetric(horizontal: 26.5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 26.5),
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
                child: customTextField(
                  context,
                  "Mobile No.",
                  _phone,
                  true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
