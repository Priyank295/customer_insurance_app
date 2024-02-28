import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/controllers.dart';

class CustomRadioButton extends StatelessWidget {
  final List<String> radioValuesList;
  final Function(String) callBack;
  CustomRadioButton(
      {super.key, required this.radioValuesList, required this.callBack});

  final CustomRadioButtonController customRadioButtonController =
      Get.put(CustomRadioButtonController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomRadioButtonController>(
      builder: (controller) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: radioValuesList.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              mainAxisExtent: 65),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (customRadioButtonController.selectedIndex == index) {
                  customRadioButtonController.onRadioButtonClicked(-1);
                } else {
                  customRadioButtonController.onRadioButtonClicked(index);
                }

                callBack(
                    radioValuesList[customRadioButtonController.selectedIndex]);
              },
              child: Container(
                // padding: EdgeInsets.only(left: 33, top: 20, bottom: 20),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: customRadioButtonController.selectedIndex == index
                        ? BorderSide(width: 1, color: Color(0xFF008EFF))
                        : BorderSide(width: 1, color: Color(0xFFDBE9F5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 33),
                      child: Text(
                        radioValuesList[index],
                        style: TextStyle(
                          color:
                              customRadioButtonController.selectedIndex == index
                                  ? Color(0xFF008EFF)
                                  : Color(0xFF939EAA),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
