import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import '../widgets/mainBtn.dart';
import 'otpVerifyScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool conditions = false;
bool invalid = false;
bool check = false;

class _RegisterScreenState extends State<RegisterScreen> {
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
                conditions
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => OtpVerifyScreen()))
                    : null;
              },
              child: MainButton(context, "Continue"))),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 10),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
