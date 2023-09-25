import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screenshot/screenshot.dart';

import '../../widgets/customAppbar.dart';
import '../../widgets/mainBtn.dart';
import 'lifeInsuranceFormScreen2.dart';

class LifeInsuranceformScreen1 extends StatefulWidget {
  static const lifeForm1 = "/lifeForm1";
  const LifeInsuranceformScreen1({super.key});

  @override
  State<LifeInsuranceformScreen1> createState() =>
      _LifeInsuranceformScreen1State();
}

ScreenshotController screenshotController = new ScreenshotController();

class _LifeInsuranceformScreen1State extends State<LifeInsuranceformScreen1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 44, left: 29, right: 29),
            width: width,
            // height: height,
            child: Stack(
              children: [
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
                    Text(
                      'Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Screenshot(
                      controller: screenshotController,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: .75,
                                  ),
                                  color: Colors.transparent),
                              child: Row(
                                children: [
                                  //policy
                                  Container(
                                    width: width / 5.5,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Policy No.",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width / 3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                  ),

                                  //Issue Date
                                  Container(
                                    width: width / 5.5,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Issue Date",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 3,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Name of the Insured",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 5,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Insured",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 5.5,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Beneficiary",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 3.5,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Insurance Start Date",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 3,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Insurance Expiry Date",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                        color: Colors.black, width: 0.75),
                                    left: BorderSide(
                                        color: Colors.black, width: 0.75),
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.75),
                                  ),
                                  color: Colors.transparent),
                              child: Row(
                                children: [
                                  //policy
                                  Container(
                                    width: width / 4.5,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Renewal Date",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width / 3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                  ),

                                  Container(
                                    width: width / 6,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Period",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 3,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Additional Supplements",
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  top: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 4,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Insured Amount",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: .75,
                                  ),
                                  color: Colors.transparent),
                              child: Row(
                                children: [
                                  //policy
                                  Container(
                                    width: width / 3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Basic Annual Premium",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width / 5,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                  ),

                                  Container(
                                    width: width / 6,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Stamp Duty",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  //policy
                                  Container(
                                    width: width / 5.3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Issue Fees",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width / 3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                  ),

                                  Container(
                                    width: width / 8,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Total",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 4,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Payment Method",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        child: SvgPicture.asset("assets/page1.svg")),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      LifeInsuranceFormScreen2()));
                        },
                        child: MainButton(context, "Next")),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height,
                  margin: EdgeInsets.only(top: 150),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
