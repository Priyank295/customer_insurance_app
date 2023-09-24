import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../common/colors.dart";

Widget ProfilePictureWidget(context) {
  return Stack(
    children: [
      Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1)),
        child: Image.asset("assets/dp.png"),
      ),
      Positioned(
          // top: 0.1,
          bottom: 1,
          right: 0.7,
          child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.vectorPrimaryColor,
              ),
              width: 18,
              height: 17,
              child: Center(child: SvgPicture.asset("assets/camera.svg"))))
    ],
  );
}
