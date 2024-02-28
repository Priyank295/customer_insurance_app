import 'package:customer_insurance_app/providers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomDropDownTextField(BuildContext context, String name,
    void Function(String) onChanged, List<DropdownMenuItem> items) {
  CustomDropDownController controller = Get.put(CustomDropDownController());
  return GetX(builder: (CustomDropDownController controller) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 26),
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: 65),
            child: DropdownButtonFormField(
              // elevation: 0,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   controller.validate(value);
              // },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
              hint: Text(
                name,
                style: GoogleFonts.nunito(
                  color: Color(0xFF939EAA),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: TextStyle(
                  fontFamily: GoogleFonts.nunito().fontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              onChanged: (value) => controller.selectedValue.value = value!,
              items: items,
            ),
          ),
          controller.error.value
              ? Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('error2.svg'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Please select a value",
                      style: TextStyle(
                        color: Color(0xFFFF5353),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  });
}

Widget CustomNormalTextField(BuildContext context, String name,
    void Function(String value) onChanged, TextEditingController controller) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 26),
    margin: EdgeInsets.symmetric(vertical: 7.5),
    child: Column(
      children: [
        Container(
          // margin: EdgeInsets.symmetric(vertical: 12.5),
          width: width,
          constraints: BoxConstraints(minHeight: 65),
          // padding: EdgeInsets.symmetric(horizontal: 26),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return "\u24D8 Please enter ${name.toLowerCase()} here";
              }
            },
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              // fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              isDense: true,
              suffixIconConstraints:
                  BoxConstraints(maxHeight: 65, maxWidth: 40),
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
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF5353),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
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
        ),
      ],
    ),
  );
}

Widget CustomDobTextField(BuildContext context, String name,
    void Function(String value) OnChanged, TextEditingController controller) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  CustomDobTextFieldController dobController =
      Get.put(CustomDobTextFieldController());
  return Obx(() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 26),
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.symmetric(vertical: 12.5),
            width: width,
            constraints: BoxConstraints(minHeight: 65),
            // padding: EdgeInsets.symmetric(horizontal: 26),
            child: TextFormField(
              controller:
                  Get.find<CustomDobTextFieldController>().controller.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return "\u24D8 Please select date";
                }
              },
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: dobController.selectedDate.value,
                    initialDatePickerMode: DatePickerMode.day,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now());
                if (picked != null) {
                  dobController.onDateChanged(picked);
                }
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                // fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
              decoration: InputDecoration(
                isDense: true,
                suffixIconConstraints:
                    BoxConstraints(maxHeight: 65, maxWidth: 40),
                suffixIcon: Container(
                  width: 100,
                  height: 65,
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/calender.svg",
                    ),
                  ),
                ),
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
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5353),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
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
          ),
        ],
      ),
    );
  });
}
