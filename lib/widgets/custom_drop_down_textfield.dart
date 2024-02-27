import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomDropDownTextField(BuildContext context, String name,
    void Function(String) onChanged, List<DropdownMenuItem> items) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 26),
    margin: EdgeInsets.symmetric(vertical: 7.5),
    constraints: BoxConstraints(minHeight: 65),
    child: DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
      hint: Text(name),
      style: TextStyle(
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      onChanged: (value) => onChanged(value!),
      items: items,
    ),
  );
}
