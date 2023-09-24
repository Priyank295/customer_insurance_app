import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import '../widgets/mainBtn.dart';
import 'bottomNavigationBarScreens.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

bool filled = false;
bool invalid = false;

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
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
                // showGeneralDialog(
                //   pageBuilder: (context, animation, secondaryAnimation) {
                //     return Container(
                //       padding: const EdgeInsets.symmetric(horizontal: 39),
                //       width: 200,
                //       height: 200,
                //       decoration: ShapeDecoration(
                //         color: Colors.white,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //         shadows: [
                //           BoxShadow(
                //             color: Color(0x3F000000),
                //             blurRadius: 48,
                //             offset: Offset(0, 4),
                //             spreadRadius: 9,
                //           )
                //         ],
                //       ),
                //     );
                //   },
                //   context: context,
                //   // context: context,
                //   // builder: (context) {
                //   //   return
                //   // },
                // );
                showGeneralDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    barrierColor: Colors.black45,
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (BuildContext buildContext,
                        Animation animation, Animation secondaryAnimation) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          width: width - 39,
                          // height: ,
                          constraints: BoxConstraints(
                              minHeight: height / 2.3, maxHeight: height / 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/verifyVector.svg"),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Material(
                                    color: Colors.white,
                                    child: Text(
                                      'Verification Successfull!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.white,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        'Your Mobile Number is Successfully Verified. Enjoy App Benefits Once Again!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF939EAA),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Material(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                BottomNavigationBarScreens()),
                                        (route) => false);
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 35),
                                    width: 281,
                                    height: 55,
                                    decoration: ShapeDecoration(
                                      gradient: AppColors.primaryGradient,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Okay',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: MainButton(context, "Verify"))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 81),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    "assets/back.svg",
                    width: 25,
                    height: 15.2,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: width,
                  child: Text(
                    'Enter Verification Code',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 11),
                  width: width,
                  child: Text(
                    'Please enter OTP(one time password) we sent to your mobile no.',
                    style: GoogleFonts.nunito(
                      color: Color(0xFF939EAA),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: const Text(
                        '+91-9907678***',
                        style: TextStyle(
                          color: Color(0xFF0A2472),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/edit.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Edit',
                            style: TextStyle(
                              color: Color(0xFFD6B268),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 51,
                ),
                Container(
                  child: Column(
                    children: [
                      OtpTextField(
                        numberOfFields: 4,
                        borderColor:
                            invalid ? Color(0xffFF5353) : Color(0xfffDBE9F5),
                        disabledBorderColor: Color(0xfffDBE9F5),
                        // hasCustomInputDecoration: true,
                        //set to true to show as box or false to show as dash
                        enabledBorderColor:
                            invalid ? Color(0xffFF5353) : Color(0xfffDBE9F5),

                        focusedBorderColor: Color(0xfff00BD79),
                        borderWidth: 1,
                        showFieldAsBox: true,
                        fieldWidth: 75,
                        cursorColor: Color(0xfffDBE9F5),
                        borderRadius: BorderRadius.circular(5),
                        filled: true,

                        textStyle: invalid
                            ? TextStyle(
                                color: Color(0xFFFF5353),
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              )
                            : TextStyle(
                                color: Color(0xFF0A2472),
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                        // decoration: InputDecoration(
                        //   hintText: "-",
                        //   // constraints: BoxConstraints(maxHeight: 64),

                        //   border: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.black, width: 1),
                        //   ),
                        // ),
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          setState(() {
                            filled = true;
                            verificationCode == "1111"
                                ? invalid = true
                                : invalid = false;
                          });
                        }, // end onSubmit
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            invalid
                                ? Row(
                                    children: [
                                      SvgPicture.asset("assets/error.svg"),
                                      SizedBox(width: 7),
                                      Text(
                                        'Invalid OTP',
                                        style: TextStyle(
                                          color: Color(0xFFFF5353),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Didn’t receive the code? ',
                                          style: GoogleFonts.nunito(
                                            color: AppColors.fontPrimaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Resend',
                                          style: GoogleFonts.nunito(
                                            color: AppColors.fontSecondaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            invalid
                                ? Text(
                                    'Resend',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF008EFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : Row(
                                    children: [
                                      SvgPicture.asset("assets/clock.svg"),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Text(
                                        '00:39',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF0A2472),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ],
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
