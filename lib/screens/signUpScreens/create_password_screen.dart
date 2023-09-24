import 'dart:convert';

import 'package:customer_insurance_app/database/apiIntegration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../models/user.dart';
import '../../widgets/bottom_nav_button.dart';
import 'finish_register_screen.dart';
import 'package:http/http.dart' as http;

class CreatePasswordScreen extends StatefulWidget {
  static const createPasswordScreen = '/createPasswordScreen';

  final User user;
  CreatePasswordScreen({required this.user});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

TextEditingController _pass = new TextEditingController();
TextEditingController _confirm = new TextEditingController();

bool isFilled = false;
final key = GlobalKey<FormState>();

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  Future<void> createUser(User user) async {
    final apiUrl =
        Uri.parse('https://soteria.thequantumtech.co.in/public/api/customer');

    final response = await http.post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> mData = await jsonDecode(response.body);
      // print(mData);
      String data = mData['data']['token'];
      String id = mData['data']['id'].toString();
      print("id : " + id);
      saveToken(data, id);
      // Data was successfully sent to the server.
      // You can handle the response here if the server sends any data back.
      print('User created successfully');
    } else {
      // Handle the error, e.g., by showing an error message to the user.
      print('Failed to create user. Status code: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: GestureDetector(
          onTap: () {
            if (key.currentState!.validate()) {
              print(widget.user.dob);
              createUser(
                User(
                  address: widget.user.address,
                  city: widget.user.city,
                  country: widget.user.country,
                  district: widget.user.district,
                  dob: widget.user.dob.toString(),
                  email: widget.user.email,
                  full_name: widget.user.full_name,
                  gender: widget.user.gender,
                  house_no: widget.user.house_no,
                  housenoandbuildingname: widget.user.housenoandbuildingname,
                  mobile_no: widget.user.mobile_no,
                  national_id:
                      int.parse(widget.user.national_id.toString()).toString(),
                  occupation: widget.user.occupation,
                  password: _pass.text,
                  road_name: widget.user.road_name,
                  state: widget.user.state,
                  street: widget.user.state,
                ),
              ).then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => FinishRegisterScreen()));
              });
            }
          },
          child: BottomNavOneButton(context, "I Agree", "")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 29),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 44, bottom: 26),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset("assets/back.svg")),
                      ],
                    ),
                  ),
                  // SizedBox(height: ,)
                  const Text(
                    'Create Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Text(
                    'Set a Password keep your account safe.',
                    style: TextStyle(
                      color: Color(0xFF939EAA),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 22),
                  PasswordTextField(controller: _pass, name: "Create Password"),
                  ConfirmPasswordTextField(
                      controller: _confirm, name: "Confirm Password")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  String name;
  TextEditingController controller;

  PasswordTextField({super.key, required this.controller, required this.name});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

bool show = false;
bool length = false, special = false;
RegExp specialCharsRegExp = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
bool eye = false;

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 26),
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(minHeight: 65),
            child: TextFormField(
              obscureText: !eye,
              obscuringCharacter: "*",
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "";
                }
                if (value.length <= 5) {
                  return "";
                }
                if (!specialCharsRegExp.hasMatch(value)) {
                  return "";
                }
              },
              onChanged: (value) {
                if (value.length == 0) {
                  setState(() {
                    show = false;
                  });
                }
                if (value.length > 0) {
                  setState(() {
                    isFilled = true;
                    show = true;
                  });
                } else {
                  setState(() {
                    isFilled = false;
                    show = false;
                  });
                }
                if (value.length < 6) {
                  setState(() {
                    length = true;
                  });
                } else {
                  setState(() {
                    length = false;
                  });
                }
                if (specialCharsRegExp.hasMatch(value)) {
                  setState(() {
                    special = true;
                  });
                } else {
                  setState(() {
                    special = false;
                  });
                }
              },
              controller: widget.controller,
              style: TextStyle(
                color: Color(0xFF0A2472),
                fontSize: 18,
                // fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 27),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        eye = !eye;
                      });
                    },
                    child: SvgPicture.asset(
                      eye ? "assets/visible.svg" : "assets/not_visible.svg",
                    ),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                label: Container(
                  child: Text(
                    widget.name,
                    style: GoogleFonts.nunito(
                      color: Color(0xFF939EAA),
                      fontSize: 18,
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
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isFilled
                          ? AppColors.filledTextFieldColor
                          : AppColors.regularTextFieldColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5353),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.focusTextFieldColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          show
              ? Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          length
                              ? SvgPicture.asset("assets/error.svg")
                              : SvgPicture.asset("assets/check.svg"),
                          SizedBox(
                            width: 11,
                          ),
                          Text(
                            'Atleast 6 Characters',
                            style: TextStyle(
                              color: length
                                  ? Color(0xFFFF5353)
                                  : Color(0xFF00BD79),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          !special
                              ? SvgPicture.asset("assets/error.svg")
                              : SvgPicture.asset("assets/check.svg"),
                          SizedBox(
                            width: 11,
                          ),
                          Text(
                            'One special keyword',
                            style: TextStyle(
                              color: !special
                                  ? Color(0xFFFF5353)
                                  : Color(0xFF00BD79),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              : Container(),
        ],
      ),
    );
  }
}

class ConfirmPasswordTextField extends StatefulWidget {
  String name;
  TextEditingController controller;

  ConfirmPasswordTextField(
      {super.key, required this.controller, required this.name});

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool show = false;
  bool same = false;
  bool eye = false;
  RegExp specialCharsRegExp = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 26),
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(minHeight: 65),
            child: TextFormField(
              obscureText: !eye,
              obscuringCharacter: "*",
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "";
                }

                if (_pass.text != value) {
                  return "";
                }
              },
              onChanged: (value) {
                if (value.length == 0) {
                  setState(() {
                    show = false;
                  });
                }
                if (value.length > 0) {
                  setState(() {
                    isFilled = true;
                    show = true;
                  });
                } else {
                  setState(() {
                    isFilled = false;
                    show = false;
                  });
                }
                if (_pass.text != value) {
                  setState(() {
                    same = false;
                  });
                } else {
                  setState(() {
                    same = true;
                  });
                }
              },
              controller: widget.controller,
              style: TextStyle(
                color: Color(0xFF0A2472),
                fontSize: 18,
                // fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 27),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        eye = !eye;
                      });
                    },
                    child: SvgPicture.asset(
                      eye ? "assets/visible.svg" : "assets/not_visible.svg",
                    ),
                  ),
                ),
                suffixIconConstraints: BoxConstraints(maxHeight: 30),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                label: Container(
                  child: Text(
                    widget.name,
                    style: GoogleFonts.nunito(
                      color: Color(0xFF939EAA),
                      fontSize: 18,
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
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isFilled
                          ? AppColors.filledTextFieldColor
                          : AppColors.regularTextFieldColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5353),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.focusTextFieldColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          show
              ? Container(
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          !same
                              ? SvgPicture.asset("assets/error.svg")
                              : SvgPicture.asset("assets/check.svg"),
                          SizedBox(
                            width: 11,
                          ),
                          Text(
                            "Both passwords must be same",
                            style: TextStyle(
                              color:
                                  !same ? Color(0xFFFF5353) : Color(0xFF00BD79),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              : Container(),
        ],
      ),
    );
  }
}
