import 'package:customer_insurance_app/screens/automativeInsurancePlanScreens/automativeInsuranceScreen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../models/automative.dart';
import '../../widgets/customTextField.dart';

class AutomativeInsuranceScreen2 extends StatefulWidget {
  static const automativeScreen2 = "/automativeScreen2";

  final Automative automative;
  AutomativeInsuranceScreen2(this.automative);

  @override
  State<AutomativeInsuranceScreen2> createState() =>
      _AutomativeInsuranceScreen2State();
}

bool allValidate = true;
final formKey = GlobalKey<FormState>();
TextEditingController _policy = TextEditingController();
TextEditingController _nat = TextEditingController();
TextEditingController _vin = TextEditingController();
TextEditingController _accident = TextEditingController();
TextEditingController _pass = TextEditingController();

class _AutomativeInsuranceScreen2State
    extends State<AutomativeInsuranceScreen2> {
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
                          builder: (ctx) => AutomativeInsuranceScreen3(
                              Automative(
                                  vahicleType: widget.automative.vahicleType,
                                  vahicleBrand: widget.automative.vahicleBrand,
                                  vahicleCategory:
                                      widget.automative.vahicleCategory,
                                  vahicleRegNo: widget.automative.vahicleRegNo,
                                  vahicleColor: widget.automative.vahicleColor,
                                  insuranceType:
                                      widget.automative.insuranceType,
                                  policyHolder: _policy.text,
                                  nationalId: int.parse(_nat.text),
                                  chassisNo: _vin.text,
                                  noOfPassanger: int.parse(_pass.text),
                                  noOfPrevAccident:
                                      int.parse(_accident.text)))));
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
                        'Automative Insurance',
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
                        Container(
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
                            context, "National ID/Resident ID", _nat, false),
                        customTextField(
                            context, "Chassis No. / VIN No.", _vin, false),
                        customTextField(context, "No. of previous accidents",
                            _accident, true),
                        customTextField(
                            context, "No. of Passengers", _pass, true),
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
