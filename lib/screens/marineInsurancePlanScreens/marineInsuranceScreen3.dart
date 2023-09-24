import 'package:customer_insurance_app/database/apiIntegration.dart';
import 'package:customer_insurance_app/screens/marineInsurancePlanScreens/marineInsuranceFormScreen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../models/marine.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customTextField.dart';

class MarineInsuranceScreen3 extends StatefulWidget {
  final Marine marine;

  MarineInsuranceScreen3(this.marine);

  @override
  State<MarineInsuranceScreen3> createState() => _MarineInsuranceScreen3State();
}

TextEditingController _policy = TextEditingController();
TextEditingController _nat = TextEditingController();
TextEditingController _from = TextEditingController();
TextEditingController _to = TextEditingController();
TextEditingController _via = TextEditingController();
TextEditingController _amount = TextEditingController();
TextEditingController _sub = TextEditingController();
final formKey = GlobalKey<FormState>();
bool allValidate = true;

class _MarineInsuranceScreen3State extends State<MarineInsuranceScreen3> {
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
                    MarineInsuranceData(Marine(
                        mobileNo: widget.marine.mobileNo,
                        transportation: widget.marine.transportation,
                        from: _from.text,
                        insuranceAmount: _amount.text,
                        nationalId: _nat.text,
                        policyHolderName: _policy.text,
                        subjectMatterInsurance: _sub.text,
                        to: _to.text,
                        via: _via.text));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => MarineInsuranceFormScreen1()));
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
                        'Marine Insurance',
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
                            context, "National ID No.", _nat, false),
                        customTextField(context, "From", _from, false),
                        customTextField(context, "Through", _to, false),
                        customTextField(context, "To", _via, false),
                        customTextField(
                            context, "Insurance Amount", _amount, false),
                        customTextField(
                            context, "Subject matter insured", _sub, false),
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
