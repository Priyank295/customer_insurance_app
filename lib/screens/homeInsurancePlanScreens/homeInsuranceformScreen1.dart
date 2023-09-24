import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/customAppbar.dart';
import '../../widgets/mainBtn.dart';
import 'homeInsuranceformScreen2.dart';

class HomeInsuranceFormScreen1 extends StatefulWidget {
  static const HomeForm1 = "/homeForm1";
  const HomeInsuranceFormScreen1({super.key});

  @override
  State<HomeInsuranceFormScreen1> createState() =>
      _HomeInsuranceFormScreen1State();
}

class _HomeInsuranceFormScreen1State extends State<HomeInsuranceFormScreen1> {
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
                              'Home Insurance',
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
                    SvgPicture.asset(
                      "assets/homeForm.svg",
                      width: MediaQuery.of(context).size.width,
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
                                      HomeInsuranceFormScreen2()));
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
                  margin: EdgeInsets.only(top: 60),
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
