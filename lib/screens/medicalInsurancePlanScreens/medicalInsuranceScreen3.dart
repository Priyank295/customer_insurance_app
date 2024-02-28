import 'package:customer_insurance_app/screens/editProfileScreen.dart';
import 'package:customer_insurance_app/widgets/custom_drop_down_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../models/medical.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/mainBtn.dart';
import 'medicalInsuranceScreen4.dart';

class MedicalInsuranceScreen3 extends StatefulWidget {
  static const MedicalScreen3 = "/medicalScreen3";
  final Medical medical;
  MedicalInsuranceScreen3({required this.medical});

  @override
  State<MedicalInsuranceScreen3> createState() =>
      _MedicalInsuranceScreen3State();
}

TextEditingController _cname = TextEditingController();
TextEditingController _expiry = TextEditingController();
TextEditingController controller = new TextEditingController();
String selectedOption = '';

class _MedicalInsuranceScreen3State extends State<MedicalInsuranceScreen3> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void showRadioDailog(context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Text('Select an option'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  title: Text('Yes'),
                  value: 'Yes',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value.toString();
                      controller.text = selectedOption;
                      print(selectedOption);
                    });
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: 'No',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value.toString();
                      controller.text = selectedOption;
                      print(selectedOption);
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 33, top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 26.5),
          child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => MedicalInsuranceScreen4(Medical(
                            age: widget.medical.age,
                            individualType: widget.medical.individualType,
                            row: widget.medical.row,
                            previouseMedicalCase: "Yes",
                            medicalDetails: "Vomit"))));
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
                    "Next",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ))),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              children: [
                CustomPolicyAppBar(context, "Individual Medical Insurance"),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.8,
                  width: width,
                  color: Color(0xFFDBE9F5),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 19.5),
                  child: SvgPicture.asset("assets/2of3.svg"),
                ),
                Container(
                  width: width,
                  height: height,
                  padding: const EdgeInsets.symmetric(horizontal: 29.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Before we proceed, \nWe need some details of yours',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        'Have any Previous Medical Insurance?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          // fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        // padding: EdgeInsets.symmetric(horizontal: 26),
                        child: TextFormField(
                          keyboardType: TextInputType.none,
                          showCursor: false,
                          controller: controller,
                          onTap: () {
                            showRadioDailog(context);
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
                            suffixIcon: "assets/downBlack.svg".length != 0
                                ? Container(
                                    width: 100,
                                    height: 65,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/downBlack.svg",
                                        color: Color(0xFF939EAA),
                                      ),
                                    ),
                                  )
                                : null,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            label: Container(
                              child: Text(
                                "Yes/No",
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
                      ),
                      selectedOption == 'Yes'
                          ? Column(
                              children: [
                                CustomNormalTextField(context, "Company Name",
                                    (value) {}, _cname),
                                CustomDobTextField(context, "Expire Date",
                                    (value) {}, controller)
                              ],
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
