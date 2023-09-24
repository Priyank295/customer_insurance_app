import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';

// ignore: must_be_immutable
class CustomTextField2 extends StatefulWidget {
  bool phone;
  String name;
  TextEditingController controller;
  CustomTextField2(
      {super.key,
      required this.name,
      required this.controller,
      required this.phone});

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

bool isFilled = false;

class _CustomTextField2State extends State<CustomTextField2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(minHeight: 65),
            child: TextFormField(
              keyboardType:
                  widget.phone ? TextInputType.number : TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "\u24D8 Please enter ${widget.name.toLowerCase()} here";
                }
              },
              onChanged: (value) {
                if (value.length > 0) {
                  setState(() {
                    isFilled = true;
                  });
                } else {
                  setState(() {
                    isFilled = false;
                  });
                }
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
        ],
      ),
    );
  }
}

Widget customTextField(
    context, String name, TextEditingController controller, bool phone) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 26),
    margin: EdgeInsets.symmetric(vertical: 7.5),
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(minHeight: 65),
          child: TextFormField(
            keyboardType: phone ? TextInputType.number : TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return "\u24D8 Please enter ${name.toLowerCase()} here";
              }
            },
            controller: controller,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              // fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              label: Container(
                child: Text(
                  name,
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
                    color: AppColors.regularTextFieldColor,
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
      ],
    ),
  );
}

class CustomTextField3 extends StatefulWidget {
  bool phone;
  String name;
  TextEditingController controller;
  CustomTextField3(
      {super.key,
      required this.name,
      required this.controller,
      required this.phone});

  @override
  State<CustomTextField3> createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomTextFieldController>(
      init: CustomTextFieldController(),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 26),
          margin: EdgeInsets.symmetric(vertical: 7.5),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(minHeight: 65),
                child: TextFormField(
                  keyboardType:
                      widget.phone ? TextInputType.number : TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "\u24D8 Please enter ${widget.name.toLowerCase()} here";
                    }
                  },
                  onChanged: (value) {
                    controller.updateIsEmpty(value.isEmpty);
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
                          color: controller.isEmpty
                              ? AppColors.regularTextFieldColor
                              : AppColors.filledTextFieldColor,
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
            ],
          ),
        );
      },
    );
  }
}

class CustomTextFieldController extends GetxController {
  bool isEmpty = true;

  void updateIsEmpty(bool value) {
    isEmpty = value;
    update();
  }
}
