import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget InsuranceTextField(
  context,
  String name,
  String icon,
) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: MediaQuery.of(context).size.width,
    height: 65,
    // padding: EdgeInsets.symmetric(horizontal: 26),
    child: TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        // fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        isDense: true,
        suffixIconConstraints: BoxConstraints(maxHeight: 65, maxWidth: 40),
        suffixIcon: icon.length != 0
            ? Container(
                width: 100,
                height: 65,
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    color: Color(0xFF939EAA),
                  ),
                ),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFDBE9F5),
              width: 1,
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
