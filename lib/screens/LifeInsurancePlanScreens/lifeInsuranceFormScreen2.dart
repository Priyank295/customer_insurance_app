import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/customAppbar.dart';
import '../../widgets/mainBtn.dart';
import '../bottomNavigationBarScreens.dart';

class LifeInsuranceFormScreen2 extends StatefulWidget {
  static const LifeForm2 = "/lifeForm2";
  const LifeInsuranceFormScreen2({super.key});

  @override
  State<LifeInsuranceFormScreen2> createState() =>
      _LifeInsuranceFormScreen2State();
}

bool conditions = false;

class _LifeInsuranceFormScreen2State extends State<LifeInsuranceFormScreen2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 44, left: 29, right: 29),
        width: width,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              margin: EdgeInsets.only(top: 45),
              child: Center(
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-0.68),
                  child: Text(
                    'DRAFT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x19EF7B00),
                      fontSize: 80,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/back.svg")),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'Life Insurance',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Policy Details',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFEF7C00),
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7, bottom: 41),
                  width: double.infinity,
                  height: 3,
                  decoration: BoxDecoration(
                      color: Color(0xFFEF7C00),
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 12, top: 9.5, bottom: 9.5),
                  width: width,
                  height: 33,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFF8E4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Note :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' For more details please download below given file.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/word.svg"),
                          SizedBox(
                            width: 9.62,
                          ),
                          Text(
                            'Trial1.docx',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/download.svg")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset("assets/page2.svg"),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          CustomCheckBox(
                            value: conditions,
                            shouldShowBorder: true,
                            borderColor: Color(0xFFF2B200),
                            checkedFillColor: Colors.transparent,
                            borderRadius: 0,
                            borderWidth: 2,
                            checkBoxSize: 28,
                            checkedIconColor: Color(0xFFF2B200),
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                conditions = val;
                              });
                            },
                          ),
                          Text(
                            'I accept all terms & conditions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      BottomNavigationBarScreens()),
                              (route) => false,
                            );
                          },
                          child: MainButton(context, "Download")),
                      SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
