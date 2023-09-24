import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget SoldPolicyWidgetTile(context, Map<String, String> data) {
  return Container(
    margin: EdgeInsets.only(top: 15),
    padding: EdgeInsets.only(left: 10, right: 16, top: 16, bottom: 15),
    width: MediaQuery.of(context).size.width,
    // height: 126,
    constraints: BoxConstraints(minHeight: 126),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 0.5,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: Color(0xFFB9D8FF),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data["logo"].toString().endsWith("png")
                  ? Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          data["logo"].toString(),
                        ),
                      ),
                    )
                  : Container(
                      height: 65,
                      width: 65,
                      // decoration: BoxDecoration(shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        data["logo"].toString(),
                        width: 65,
                        height: 65,
                      )),
              const SizedBox(
                width: 13,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 173,
                    child: Text(
                      data["name"].toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 173,
                    child: Text(
                      '₹ 1 Lakh Term Plan',
                      style: TextStyle(
                        color: Color(0xFFD6B268),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 9),
                    width: 173,
                    child: Text(
                      'Customer Name',
                      style: TextStyle(
                        color: Color(0xFF2255A4),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 173,
                    child: Text(
                      '14 December 2022, 04:24 PM',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            width: 67,
            height: 32,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.25,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFEF7C00),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                'View',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEF7C00),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ]),
  );
}
