import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/customRadioButton.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/mainBtn.dart';
import 'lifeInsuranceScreen2.dart';
import 'lifeInsuranceScreen2IfFamily.dart';

class LifeInsuranceScreen1 extends StatefulWidget {
  static const lifeInsurancePlan = "/lifeInsurance";
  const LifeInsuranceScreen1({super.key});

  @override
  State<LifeInsuranceScreen1> createState() => _LifeInsuranceScreen1State();
}

final formKey = GlobalKey<FormState>();
bool allValidate = true;
TextEditingController _age = TextEditingController();
String radioData = '';

class _LifeInsuranceScreen1State extends State<LifeInsuranceScreen1> {
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
      bottomNavigationBar: Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: 33),
          padding: const EdgeInsets.symmetric(horizontal: 26.5),
          child: InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  radioData == "All Family"
                      ? Navigator.pushNamed(context, "/lifeScreen2IfFamily")
                      : Navigator.pushNamed(context, "/lifeScreen2");
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
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
                  child: radioData == "All Family"
                      ? SvgPicture.asset("assets/1of3.svg")
                      : SvgPicture.asset("assets/1of2.svg"),
                ),
                Container(
                  width: width,
                  //
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 26.5),
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
                              radioValuesList: const [
                                "Self",
                                "Spouse",
                                "Parents",
                                "Son",
                                "Daugther",
                                "All Family"
                              ],
                              callBack: getDataFromChild,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'How old the member is?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                // fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Form(
                          key: formKey,
                          child: customTextField(context, "Age", _age, true)),
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
}
