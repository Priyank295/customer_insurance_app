import 'dart:convert';

import 'package:customer_insurance_app/screens/signUpScreens/signup_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import '../widgets/mainBtn.dart';
import 'registerScreen.dart';
import 'package:http/http.dart' as http;

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
    'language': 'ar_AR'
  },
  {
    "name": "English",
    "icon": "assets/english.svg",
    "value": "1",
    'language': 'en_US'
  },
];

TextEditingController find = new TextEditingController();
List<Map<String, String>> filteredItems = [];

int selected = -1;

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  void filterSearchResults(String query) {
    List<Map<String, String>> searchResults = [];
    if (query.isNotEmpty) {
      languages.forEach((item) {
        if (item['name']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });
    } else {
      searchResults.addAll(languages);
    }

    setState(() {
      filteredItems.clear();
      filteredItems.addAll(searchResults);
    });
  }

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
            // bottom: 42,
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
                  'select'.tr,
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
                            controller: find,
                            onChanged: filterSearchResults,
                            cursorColor: AppColors.fontPrimaryColor,
                            decoration: InputDecoration(
                              hintText: "find".tr,
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredItems.isEmpty
                    ? languages.length
                    : filteredItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = index;
                        Get.updateLocale(Locale(filteredItems.isEmpty
                            ? languages[index]['language'].toString()
                            : filteredItems[index]['language'].toString()));
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
                        color: selected == index
                            ? Color(0xFFFFE7A5)
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 29),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                filteredItems.isEmpty
                                    ? languages[index]['name'].toString()
                                    : filteredItems[index]['name'].toString(),
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: selected == index
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                              SvgPicture.asset(
                                filteredItems.isEmpty
                                    ? languages[index]['icon'].toString()
                                    : filteredItems[index]['icon'].toString(),
                                color: selected == index ? Colors.black : null,
                              ),
                            ]),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Expanded(
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
                            if (selected == -1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Please select language")));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => RegisterScreen()));
                            }
                          },
                          child: MainButton(context, "next".tr),
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
                              'have'.tr,
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
                              'signUp'.tr,
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
