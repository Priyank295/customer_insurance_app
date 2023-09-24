import 'package:customer_insurance_app/screens/signUpScreens/signup_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import '../widgets/mainBtn.dart';
import 'registerScreen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  static const String languageSelectionScreen = "/language";
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

const List<Map<String, String>> languages = [
  {
    "name": "Arabic",
    "icon": "assets/arabic.svg",
    "value": "0",
  },
  {
    "name": "English",
    "icon": "assets/english.svg",
    "value": "1",
  },
];

int selected = -1;

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.only(
            left: 27,
            right: 27,
            top: 81,
            bottom: 42,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                "assets/logo.svg",
                width: 93,
                height: 70.6,
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                width: width,
                child: Text(
                  'Select Your Preferred Language',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: width,
                  height: 65,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1, color: AppColors.borderPrimaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/search.svg"),
                        // const SizedBox(
                        //   width: 14,
                        // ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: AppColors.fontPrimaryColor,
                            decoration: InputDecoration(
                              hintText: "Find a language",
                              hintStyle: GoogleFonts.nunito(
                                color: AppColors.fontPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 38,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  height: 79,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFFE7A5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color:
                        selected == 0 ? Color(0xFFFFE7A5) : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Arabic",
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: selected == 0
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/arabic.svg",
                            color: selected == 0 ? Colors.black : null,
                          ),
                        ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  height: 79,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFFE7A5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color:
                        selected == 1 ? Color(0xFFFFE7A5) : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "English",
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: selected == 1
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/english.svg",
                            color: selected == 1 ? Colors.black : null,
                          ),
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      color: Colors.transparent,
                      margin: EdgeInsets.only(bottom: 16),
                      // padding: const EdgeInsets.symmetric(horizontal: 26.5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => RegisterScreen()));
                        },
                        child: MainButton(context, "Next"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const SignUpRegisterScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
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
                            'Sign Up',
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

Widget languageContainer(context, Map<String, String> data) {
  return GestureDetector(
    child: Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 79,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFFFE7A5)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            data["name"].toString(),
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SvgPicture.asset(data["icon"].toString())
        ]),
      ),
    ),
  );
}
