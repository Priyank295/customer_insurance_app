import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customRadioButton.dart';
import '../../widgets/customTextField.dart';
import 'illnessInsuranceScreen2.dart';

class IllnessInsuranceScreen1 extends StatefulWidget {
  static const String illnessScreen1 = "/illnessScreen1";
  const IllnessInsuranceScreen1({super.key});

  @override
  State<IllnessInsuranceScreen1> createState() =>
      _IllnessInsuranceScreen1State();
}

String radioData = "";
final formKey = GlobalKey<FormState>();
TextEditingController _age = TextEditingController();

bool allValidate = true;

class _IllnessInsuranceScreen1State extends State<IllnessInsuranceScreen1> {
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
                  Navigator.pushNamed(context, "/illnessScreen2");
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
                CustomPolicyAppBar(context, "Critical Illness Insurance"),
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
                        radioValuesList: const [
                          "Self",
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
                  child: customTextField(
                    context,
                    "Age",
                    _age,
                    true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
