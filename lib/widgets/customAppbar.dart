import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'tourWidgets.dart';

Widget CustomAppBar(context) {
  return Container(
    margin: EdgeInsets.only(bottom: 23),
    width: double.infinity,
    // height: 26,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/logo.svg",
              width: 34,
            ),
            const SizedBox(
              width: 12.77,
            ),
            const Text(
              'Welcome, Mansi!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.5),
              child: SvgPicture.asset(
                "assets/search2.svg",
                // width: 20,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.5),
              child: SvgPicture.asset(
                "assets/notification.svg",
              ),
            ),
            GestureDetector(
              onTap: () {
                showGeneralDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    barrierColor: Colors.black45,
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (BuildContext buildContext,
                        Animation animation, Animation secondaryAnimation) {
                      return tour4(context);
                    });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.5),
                child: SvgPicture.asset(
                  "assets/language.svg",
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget CustomPolicyAppBar(context, String name) {
  return Container(
    margin: const EdgeInsets.only(top: 44, left: 29),
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
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
