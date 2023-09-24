import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customTextField.dart';

class HomeInsuranceScreen1 extends StatefulWidget {
  static const String homeInsuranceRoute = "/homeInsurance";
  const HomeInsuranceScreen1({super.key});

  @override
  State<HomeInsuranceScreen1> createState() => _HomeInsuranceScreen1State();
}

TextEditingController _fname = TextEditingController();
TextEditingController _nat = TextEditingController();
TextEditingController _natId = TextEditingController();
TextEditingController _limit = TextEditingController();
TextEditingController _category = TextEditingController();
TextEditingController _size = TextEditingController();
TextEditingController _location = TextEditingController();

final formKey = GlobalKey<FormState>();
bool allValidate = true;
String selectedOption = '';

bool fnameEmpty = false,
    natEmpty = false,
    natIdEmpty = false,
    limitEmpty = false,
    categoryEmpty = false,
    sizeEmpty = false,
    locationEmpty = false;
// bool isFilled = false;

class _HomeInsuranceScreen1State extends State<HomeInsuranceScreen1> {
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
                title: Text('3 Bedrooms'),
                value: '3 Bedrooms',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                    _category.text = selectedOption;
                    categoryEmpty = false;
                    // isFilled = true;
                    print(selectedOption);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('4 Bedrooms'),
                value: '4 Bedrooms',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                    _category.text = selectedOption;
                    categoryEmpty = false;
                    // isFilled = true;
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

  bool allValidate = true;

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
                  Navigator.pushNamed(context, "/homeScreen2");
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
                CustomPolicyAppBar(context, "Home Insurance"),
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
                        // customTextField(context, "Full Name", _fname, false),
                        CustomTextField3(
                            phone: false,
                            controller: _fname,
                            name: "Full Name"),
                        CustomTextField3(
                            name: "Nationality",
                            controller: _nat,
                            phone: false),
                        CustomTextField3(
                            name: "National ID or Resident ID",
                            controller: _natId,
                            phone: false),
                        CustomTextField3(
                            name: "Limit of Coverage",
                            controller: _limit,
                            phone: false),

                        CustomTextField2(
                            name: "Size of Apartment or Villa",
                            controller: _size,
                            phone: false),
                        CustomTextField2(
                            name: "Detailed Location",
                            controller: _location,
                            phone: false)
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

  @override
  void dispose() {
    _fname.dispose();
    _nat.dispose();
    _natId.dispose();
    _limit.dispose();
    _category.dispose();
    _size.dispose();
    _location.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
