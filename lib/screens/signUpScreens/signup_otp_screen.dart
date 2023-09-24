import 'package:customer_insurance_app/screens/signUpScreens/signup_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/mainBtn.dart';
import '../bottomNavigationBarScreens.dart';

class SignUpOtpScreen extends StatefulWidget {
  String phone;
  SignUpOtpScreen(this.phone);

  @override
  State<SignUpOtpScreen> createState() => _SignUpOtpScreenState();
}

bool filled = false;
bool invalid = false;

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => SignUpProfileScreen(widget.phone)),
                    (route) => false);
              },
              child: MainButton(context, "Next"))),
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
                        margin: EdgeInsets.symmetric(horizontal: 8),
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
