import 'package:customer_insurance_app/database/getdataApi.dart';
import 'package:customer_insurance_app/widgets/custom_drop_down_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../common/colors.dart';
import '../models/user.dart';
import '../widgets/mainBtn.dart';
import '../widgets/profilePictureWidget.dart';

class EditProfileScreen extends StatelessWidget {
  // const EditProfileScreen({super.key});

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

  final formKey = GlobalKey<FormState>();
  bool allValidate = true;
  late User user;
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 26),
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
                      'Edit Profile',
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Stack(
                  children: [
                    Container(
                      width: 91,
                      height: 91,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.vectorPrimaryColor, width: 1)),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            "assets/dp.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                      // top: 0.1,
                      bottom: 1,
                      right: 0.7,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        width: 29,
                        height: 28,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/camera.svg",
                            color: AppColors.vectorPrimaryColor,
                            width: 15,
                            height: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // FutureBuilder<User>(
              //   future: getUsetData(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       return
              //     }
              //   },
              // ),
              Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomDropDownTextField(
                            context, "Choose your Language", (val) {}, [
                          DropdownMenuItem(
                            child: Text("English"),
                            value: "English",
                          ),
                          DropdownMenuItem(
                            child: Text("Arabic"),
                            value: "Arabic",
                          ),
                        ]),
                        CustomNormalTextField(
                            context, "Name", (value) {}, name),
                        CustomNormalTextField(
                          context,
                          "Email ID",
                          (value) {},
                          email,
                        ),
                        CustomDropDownTextField(context, "Gender", (p0) {}, [
                          DropdownMenuItem(
                            child: Text("Male"),
                            value: "Male",
                          ),
                          DropdownMenuItem(
                            child: Text("Female"),
                            value: "Female",
                          )
                        ]),
                        CustomDobTextField(
                            context, "BirthDate (DD/MM/YYY)", (value) {}, dob),
                        CustomNormalTextField(
                            context, "Mobile No.", (value) {}, mobile),
                        CustomDropDownTextField(
                            context, "Nationality", (p0) {}, [
                          DropdownMenuItem(
                            child: Text("Bangladeshi"),
                            value: "Bangladeshi",
                          ),
                          DropdownMenuItem(
                            child: Text("Indian"),
                            value: "Indian",
                          )
                        ]),
                        CustomDropDownTextField(
                            context, "Occupation", (p0) {}, [
                          DropdownMenuItem(
                            child: Text("Student"),
                            value: "Student",
                          ),
                          DropdownMenuItem(
                            child: Text("Teacher"),
                            value: "Teacher",
                          )
                        ]),
                        CustomDropDownTextField(
                            context, "Marital Status", (p0) {}, [
                          DropdownMenuItem(
                            child: Text("Single"),
                            value: "Single",
                          ),
                          DropdownMenuItem(
                            child: Text("Married"),
                            value: "Married",
                          ),
                          DropdownMenuItem(
                            child: Text("Divorced"),
                            value: "Divorced",
                          ),
                          DropdownMenuItem(
                            child: Text("Windowed"),
                            value: "Windowed",
                          )
                        ]),
                        CustomNormalTextField(
                            context, "Country", (value) {}, country),
                        CustomNormalTextField(
                            context, "City", (value) {}, city),
                        CustomNormalTextField(
                            context, "District", (value) {}, district),
                        CustomNormalTextField(
                            context, "National ID", (value) {}, nationalId),
                        CustomNormalTextField(
                            context, "Road Name", (value) {}, road),
                        CustomNormalTextField(context,
                            "House No./Building Name", (value) {}, house),
                        CustomNormalTextField(
                            context, "Place of Work", (value) {}, placeToWork),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Container(
                              margin: EdgeInsets.only(top: 50, bottom: 19),
                              child: MainButton(context, "Save")),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
      padding: EdgeInsets.symmetric(horizontal: 26),
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.symmetric(vertical: 12.5),
            width: width,
            constraints: BoxConstraints(minHeight: 65),
            // padding: EdgeInsets.symmetric(horizontal: 26),
            child: TextFormField(
              controller: widget.controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "\u24D8 Please enter ${widget.name.toLowerCase()} here";
                }
              },
              onTap: () {
                widget.needCalender ? _selectDate(context) : null;
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                // fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
              decoration: InputDecoration(
                isDense: true,
                suffixIconConstraints:
                    BoxConstraints(maxHeight: 65, maxWidth: 40),
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
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                errorStyle: TextStyle(
                  color: Color(0xFFFF5353),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5353),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5353),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
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
          ),
        ],
      ),
    );
  }
}
