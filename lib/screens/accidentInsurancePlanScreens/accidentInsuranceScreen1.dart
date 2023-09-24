import 'package:customer_insurance_app/screens/accidentInsurancePlanScreens/accidentInsuranceFormScreen2.dart';
import 'package:customer_insurance_app/screens/accidentInsurancePlanScreens/accidentInsuranceScreen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../models/accident.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customTextField.dart';

class AccidentScreen1 extends StatefulWidget {
  static const String accidentInsurancePlan = "/accidentInsurancePlan";
  const AccidentScreen1({super.key});

  @override
  State<AccidentScreen1> createState() => _AccidentScreen1State();
}

TextEditingController _fname = new TextEditingController();
TextEditingController _mname = new TextEditingController();
TextEditingController _lname = new TextEditingController();
TextEditingController _age = new TextEditingController();
final formKey = GlobalKey<FormState>();
bool allValidate = true;

class _AccidentScreen1State extends State<AccidentScreen1> {
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
                          builder: (ctx) => AccidentScreen2(Accident(
                              firstName: _fname.text,
                              middleName: _mname.text,
                              lastName: _lname.text,
                              age: _age.text))));
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
              CustomPolicyAppBar(context, "Personal Accident Insurance"),
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
                        height: 25,
                      ),
                      customTextField(context, "First Name", _fname, false),
                      customTextField(context, "Middle Name", _mname, false),
                      customTextField(context, "Last Name", _lname, false),
                      customTextField(context, "How old you are?", _age, true),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
