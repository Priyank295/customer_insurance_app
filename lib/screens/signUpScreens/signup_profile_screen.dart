import 'dart:convert';

import 'package:customer_insurance_app/models/user.dart';
import 'package:customer_insurance_app/screens/signUpScreens/signup_id_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../common/colors.dart';
import '../../widgets/mainBtn.dart';

class SignUpProfileScreen extends StatefulWidget {
  String phone;
  SignUpProfileScreen(this.phone);

  @override
  State<SignUpProfileScreen> createState() => _SignUpProfileScreenState();
}

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController gender = TextEditingController();
TextEditingController dob = TextEditingController();
TextEditingController mobile = TextEditingController();
TextEditingController occupation = TextEditingController();
TextEditingController country = TextEditingController();
TextEditingController city = TextEditingController();
TextEditingController district = TextEditingController();
TextEditingController road = TextEditingController();
TextEditingController house = TextEditingController();
TextEditingController placeToWork = TextEditingController();
TextEditingController nationalId = TextEditingController();

class _SignUpProfileScreenState extends State<SignUpProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 44, left: 29),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/back.svg")),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      'Personal Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 0.8,
                width: width,
                color: Color(0xFFDBE9F5),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Let Us know you more!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Please fill some information below. It will help us to know you more.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF939EAA),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Column(
                children: [
                  CustomTextField(
                      name: "Name",
                      icon: "",
                      needCalender: false,
                      controller: name),
                  CustomTextField(
                    name: "Email ID",
                    icon: "",
                    controller: email,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "Gender",
                    icon: "assets/downBlack.svg",
                    controller: gender,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "Birthdate (DD/MM/YYYY)",
                    icon: "assets/calender.svg",
                    controller: dob,
                    needCalender: true,
                  ),
                  CustomTextField(
                    name: "Mobile No.",
                    icon: "assets/lock.svg",
                    controller: mobile,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "Occupation",
                    icon: "assets/downBlack.svg",
                    controller: occupation,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "Country",
                    icon: "assets/downBlack.svg",
                    controller: country,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "City",
                    icon: "assets/downBlack.svg",
                    controller: city,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "District",
                    icon: "assets/downBlack.svg",
                    controller: district,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "National ID",
                    icon: "",
                    controller: nationalId,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "Road Name",
                    icon: "assets/downBlack.svg",
                    controller: road,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "House No./Building Name",
                    icon: "assets/downBlack.svg",
                    controller: house,
                    needCalender: false,
                  ),
                  CustomTextField(
                    name: "Place of Work",
                    icon: "",
                    controller: placeToWork,
                    needCalender: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => SignUpIDScannerScreen(
                                      user: User(
                                        full_name: name.text,
                                        email: email.text,
                                        gender: gender.text,
                                        dob: dob.text,
                                        mobile_no: widget.phone,
                                        occupation: occupation.text,
                                        country: country.text,
                                        city: city.text,
                                        district: district.text,
                                        national_id: nationalId.text,
                                        road_name: road.text,
                                        house_no: house.text,
                                        housenoandbuildingname: house.text,
                                        address:
                                            road.text + house.text + city.text,
                                        street: road.text,
                                        state: district.text,
                                        password: "",
                                      ),
                                    )));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(top: 50, bottom: 19),
                          child: MainButton(context, "Save & Next")),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  String name, icon;
  TextEditingController controller;
  bool needCalender;
  CustomTextField(
      {super.key,
      required this.name,
      required this.icon,
      required this.controller,
      required this.needCalender});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

DateTime selectedDate = DateTime.now();

class _CustomTextFieldState extends State<CustomTextField> {
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (picked != null)
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat.yMd().format(selectedDate);
        // widget.controller.text = selectedDate.toIso8601String();
      });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.5),
      width: width,
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: TextFormField(
        onTap: () {
          widget.needCalender ? _selectDate(context) : null;
        },
        controller: widget.controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          // fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          isDense: true,
          suffixIconConstraints: BoxConstraints(maxHeight: 65, maxWidth: 40),
          suffixIcon: widget.icon.length != 0
              ? Container(
                  width: 100,
                  height: 65,
                  child: Center(
                    child: SvgPicture.asset(
                      widget.icon,
                    ),
                  ),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          label: Container(
            child: Text(
              widget.name,
              style: GoogleFonts.nunito(
                color: Color(0xFF939EAA),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff008EFF),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
