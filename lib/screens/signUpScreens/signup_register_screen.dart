import 'package:custom_check_box/custom_check_box.dart';
import 'package:customer_insurance_app/screens/registerScreen.dart';
import 'package:customer_insurance_app/screens/signUpScreens/signup_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/mainBtn.dart';

class SignUpRegisterScreen extends StatefulWidget {
  const SignUpRegisterScreen({super.key});

  @override
  State<SignUpRegisterScreen> createState() => _SignUpRegisterScreenState();
}

bool conditions = false;
bool invalid = false;
bool check = false;

class _SignUpRegisterScreenState extends State<SignUpRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          // height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 51),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                "assets/logo.svg",
                width: 93,
                height: 70.6,
              ),
              const SizedBox(
                height: 31,
              ),
              SizedBox(
                width: 295,
                child: Text(
                  'Welcome',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width,
                child: Text(
                  'Please enter your registered Mobile No. to login again to your app!',
                  style: GoogleFonts.nunito(
                    color: Color(0xFF939EAA),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: width,
                height: 65,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: invalid
                        ? BorderSide(width: 1, color: Color(0xFFFF5353))
                        : BorderSide(width: 1, color: Color(0xFFDBE9F5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
                  child: Row(children: [
                    SizedBox(
                      height: double.infinity,
                      child: SvgPicture.asset(
                        "assets/jordan3.svg",
                        height: 20,
                        width: 29,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: Text(
                        '+962',
                        style: GoogleFonts.nunito(
                          color: Color(0xFF939EAA),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SvgPicture.asset("assets/down.svg"),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 11.5),
                      height: double.infinity,
                      color: invalid ? Color(0xffFF5353) : Color(0xFFDBE9F5),
                      width: 1,
                    ),
                    Expanded(
                      child: TextFormField(
                        maxLength: 10,
                        onChanged: (value) {
                          // if (value.length < 10) {
                          //   setState(() {
                          //     invalid = true;
                          //   });
                          // } else {
                          //   setState(() {
                          //     invalid = false;
                          //   });
                          // }
                          if (value.length == 10) {
                            setState(() {
                              invalid = false;
                              check = true;
                            });
                          } else {
                            setState(() {
                              invalid = true;
                              check = false;
                            });
                          }
                        },
                        keyboardType: TextInputType.phone,
                        style: GoogleFonts.nunito(
                          color: Color(0xFF03045E),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        cursorColor: AppColors.fontPrimaryColor,
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.only(top: 15, left: 4),
                          hintText: "Enter Mobile No.",
                          suffixIcon: invalid
                              ? SvgPicture.asset("assets/error.svg")
                              : check
                                  ? SvgPicture.asset("assets/check.svg")
                                  : Container(),
                          suffixIconConstraints:
                              BoxConstraints(maxHeight: 18, maxWidth: 18),
                          hintStyle: GoogleFonts.nunito(
                            color: AppColors.fontPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    CustomCheckBox(
                      value: conditions,
                      shouldShowBorder: true,
                      borderColor: Color(0xFFDBE9F5),
                      checkedFillColor: Color(0xFF2196F3).withOpacity(0.5),
                      borderRadius: 4,
                      borderWidth: 1,
                      checkBoxSize: 18,
                      onChanged: (val) {
                        //do your stuff here
                        setState(() {
                          conditions = val;
                        });
                      },
                    ),
                    // const SizedBox(
                    //   width: 11,
                    // ),
                    Expanded(
                      // width: double.maxFinite,
                      // height: 50,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'By SignIn to account, you agree to our ',
                              style: GoogleFonts.nunito(
                                color: AppColors.fontPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: GoogleFonts.nunito(
                                color: AppColors.fontSecondaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: GoogleFonts.nunito(
                                color: AppColors.fontPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: GoogleFonts.nunito(
                                color: AppColors.fontSecondaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      color: Colors.transparent,
                      // margin: EdgeInsets.only(bottom: 27),
                      // padding: const EdgeInsets.symmetric(horizontal: 26.5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const SignUpOtpScreen()));
                        },
                        child: MainButton(context, "Sign Up"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 27),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 1,
                              // width: double.infinity,
                              color: Color(0xFFDBE9F5),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Or SignUp with',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF939EAA),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 1,
                              // width: double.infinity,
                              color: Color(0xFFDBE9F5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 12.5),
                            child: SvgPicture.asset("assets/google.svg")),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 12.5),
                            child: SvgPicture.asset("assets/facebook.svg")),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 12.5),
                            child: SvgPicture.asset("assets/apple.svg")),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF939EAA),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Log In',
                            style: TextStyle(
                              color: Color(0xFF0A2472),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
