import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';

class ApplyPromoScreen extends StatefulWidget {
  const ApplyPromoScreen({super.key});

  @override
  State<ApplyPromoScreen> createState() => _ApplyPromoScreenState();
}

TextEditingController controller = new TextEditingController();

class _ApplyPromoScreenState extends State<ApplyPromoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 44),
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: Row(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/back.svg")),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Apply Promo Code',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFDBE9F5),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 29),
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(minHeight: 65),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "\u24D8 Please enter ${widget.name.toLowerCase()} here";
                  //   }
                  // },
                  // onChanged: (value) {
                  //   controller.updateIsEmpty(value.isEmpty);
                  // },
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
                        "Promo Code",
                        style: GoogleFonts.nunito(
                          color: Color(0xFF939EAA),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    suffix: Text(
                      'APPLY',
                      style: TextStyle(
                        color: Color(0xFFFF5353),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // suffixText: "APPLY",
                    // suffixStyle: TextStyle(
                    //   color: Color(0xFF939EAA),
                    //   fontSize: 18,
                    //   fontWeight: FontWeight.w600,
                    // ),
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
                          color: controller.text.isEmpty
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 29),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color: Color(0x7FDBE9F5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Offers',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              PromocodeWidget(),
              PromocodeWidget(),
              PromocodeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class PromocodeWidget extends StatefulWidget {
  const PromocodeWidget({super.key});

  @override
  State<PromocodeWidget> createState() => _PromocodeWidgetState();
}

class _PromocodeWidgetState extends State<PromocodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 29, vertical: 20),
          child: Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DottedBorder(
                      color: Color(0xFFFFE7A5),
                      strokeWidth: 1,
                      child: Container(
                        width: 176,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF8E4),
                        ),
                        child: Center(
                          child: Text(
                            'dsfi3udefds2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFEF7C00),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'APPLY',
                      style: TextStyle(
                        color: Color(0xFFFF5353),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  'Coupon description Coupon description Coupon description Coupon description Coupon description',
                  style: TextStyle(
                    color: Color(0xFF939EAA),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Color(0xFFDBE9F5),
        )
      ],
    );
  }
}
