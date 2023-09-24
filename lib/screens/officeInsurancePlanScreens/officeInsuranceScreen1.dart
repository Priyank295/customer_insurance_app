import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/customTextField.dart';

class OfficeInsuranceScreen1 extends StatefulWidget {
  static const officeScreen1 = "/officeScreen1";
  const OfficeInsuranceScreen1({super.key});

  @override
  State<OfficeInsuranceScreen1> createState() => _OfficeInsuranceScreen1State();
}

TextEditingController _fname = TextEditingController();
TextEditingController _mname = TextEditingController();
TextEditingController _lname = TextEditingController();
TextEditingController _nat = TextEditingController();
TextEditingController _category = TextEditingController();
TextEditingController _building = TextEditingController();
TextEditingController _vila = TextEditingController();
TextEditingController _size = TextEditingController();
TextEditingController _country = TextEditingController();
TextEditingController _city = TextEditingController();
TextEditingController _area = TextEditingController();
TextEditingController _address = TextEditingController();

final formKey = GlobalKey<FormState>();
bool allValidate = true;

class _OfficeInsuranceScreen1State extends State<OfficeInsuranceScreen1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: 33),
          padding: const EdgeInsets.symmetric(horizontal: 26.5),
          child: InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "/officeScreen2");
                } else {
                  setState(() {
                    allValidate = false;
                  });
                }
              },
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 26.5, vertical: 33),
                width: MediaQuery.of(context).size.width,
                height: 55,
                decoration: ShapeDecoration(
                  gradient: allValidate
                      ? AppColors.primaryGradient
                      : AppColors.secondaryGradient,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: width,
            child: Column(
              children: [
                CustomPolicyAppBar(context, "Office Insurance"),
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
                  child: SvgPicture.asset("assets/1of3.svg"),
                ),
                Container(
                  width: width,
                  // padding: const EdgeInsets.symmetric(horizontal: 26.5),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 26.5),
                          child: Text(
                            'Before we proceed, \nWe need some details of yours',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // customTextField(context, "Full Name", _fname, false),
                        CustomTextField2(
                            phone: false,
                            controller: _fname,
                            name: "Full Name"),
                        CustomTextField2(
                            name: "Middle Name",
                            controller: _mname,
                            phone: false),
                        CustomTextField2(
                            name: "Last Name",
                            controller: _lname,
                            phone: false),
                        CustomTextField2(
                            name: "Nationality",
                            controller: _nat,
                            phone: false),

                        CustomTextField2(
                            name: "Building No.",
                            controller: _building,
                            phone: false),
                        CustomTextField2(
                            name: "Appartment/Villa",
                            controller: _vila,
                            phone: false),
                        CustomTextField2(
                            name: "Size of Appartment or villa",
                            controller: _size,
                            phone: false),
                        CustomTextField2(
                            name: "Country",
                            controller: _country,
                            phone: false),
                        CustomTextField2(
                            name: "City", controller: _city, phone: false),
                        CustomTextField2(
                            name: "Area", controller: _area, phone: false),
                        CustomTextField2(
                            name: "Address",
                            controller: _address,
                            phone: false),
                      ],
                    ),
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
