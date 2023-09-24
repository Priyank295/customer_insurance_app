import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';

Widget MainButton(context, String name) {
  double width = MediaQuery.of(context).size.width;
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 26.5, vertical: 33),
    width: width,
    height: 55,
    decoration: ShapeDecoration(
      gradient: AppColors.secondaryGradient,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
    ),
    child: Center(
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
