import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import 'mainBtn.dart';

Widget BottomNavTwoButton(context, String route) {
  return Container(
    margin: EdgeInsets.only(bottom: 33),
    padding: EdgeInsets.symmetric(horizontal: 26),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 55,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFDBE9F5)),
                borderRadius: BorderRadius.circular(27.50),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(
                "assets/edit.svg",
                color: AppColors.vectorPrimaryColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Edit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEF7C00),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ]),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, route);
            },
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 55,
                decoration: ShapeDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget BottomNavOneButton(
  context,
  String name,
  String route,
) {
  return Container(
    color: Colors.white,
    margin: EdgeInsets.only(bottom: 33, top: 15),
    padding: const EdgeInsets.symmetric(horizontal: 26.5),
    child: route.isNotEmpty
        ? InkWell(
            onTap: () {
              if (route.isNotEmpty) {
                Navigator.pushNamed(context, route);
              }
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 26.5, vertical: 33),
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: ShapeDecoration(
                gradient: AppColors.primaryGradient,
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
            ))
        : Container(
            // margin: EdgeInsets.symmetric(horizontal: 26.5, vertical: 33),
            width: MediaQuery.of(context).size.width,
            height: 55,
            decoration: ShapeDecoration(
              gradient: AppColors.primaryGradient,
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
          ),
  );
}
