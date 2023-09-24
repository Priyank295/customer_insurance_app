import 'package:customer_insurance_app/screens/LifeInsurancePlanScreens/lifeInsuranceScreen1.dart';
import 'package:customer_insurance_app/screens/automativeInsurancePlanScreens/automativeInsuranceScreen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/colors.dart';
import '../../models/automative.dart';
import '../../widgets/customTextField.dart';

class AutomativeInsuranceScreen1 extends StatefulWidget {
  static const automativeScreen1 = "/automativeScreen1";
  const AutomativeInsuranceScreen1({super.key});

  @override
  State<AutomativeInsuranceScreen1> createState() =>
      _AutomativeInsuranceScreen1State();
}

String selectedOption1 = '';
String selectedOption2 = '';
TextEditingController typeController = new TextEditingController();
TextEditingController insuranceController = new TextEditingController();
TextEditingController _brand = TextEditingController();
TextEditingController _category = TextEditingController();
TextEditingController _color = TextEditingController();
TextEditingController _reg = TextEditingController();
List<TextEditingController> imageTF = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];
List<ImagePicker> imagePickerList = [
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
];
final formKey = GlobalKey<FormState>();
bool allValidate = true;

class _AutomativeInsuranceScreen1State
    extends State<AutomativeInsuranceScreen1> {
  Future<void> _pickImage(
      ImagePicker imgPicker, TextEditingController tc) async {
    final pickedImage = await imgPicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        tc.text = pickedImage.name;
      });
    }
  }

  void showRadioDailog1(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Select an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: Text('Salon'),
                value: 'Salon',
                groupValue: selectedOption1,
                onChanged: (value) {
                  setState(() {
                    selectedOption1 = value.toString();
                    typeController.text = selectedOption1;
                    print(selectedOption1);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Van'),
                value: 'Van',
                groupValue: selectedOption1,
                onChanged: (value) {
                  setState(() {
                    selectedOption1 = value.toString();
                    typeController.text = selectedOption1;
                    print(selectedOption1);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Pickup'),
                value: 'Pickup',
                groupValue: selectedOption1,
                onChanged: (value) {
                  setState(() {
                    selectedOption1 = value.toString();
                    typeController.text = selectedOption1;
                    print(selectedOption1);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Scooter'),
                value: 'Scooter',
                groupValue: selectedOption1,
                onChanged: (value) {
                  setState(() {
                    selectedOption1 = value.toString();
                    typeController.text = selectedOption1;
                    print(selectedOption1);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Motorcycle'),
                value: 'Motorcycle',
                groupValue: selectedOption1,
                onChanged: (value) {
                  setState(() {
                    selectedOption1 = value.toString();
                    typeController.text = selectedOption1;
                    print(selectedOption1);
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

  void showRadioDailog2(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Select an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: Text('Mandatory'),
                value: 'Mandatory',
                groupValue: selectedOption2,
                onChanged: (value) {
                  setState(() {
                    selectedOption2 = value.toString();
                    insuranceController.text = selectedOption2;
                    print(selectedOption2);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Comprehensive'),
                value: 'Comprehensive',
                groupValue: selectedOption2,
                onChanged: (value) {
                  setState(() {
                    selectedOption2 = value.toString();
                    insuranceController.text = selectedOption2;
                    print(selectedOption2);
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => AutomativeInsuranceScreen2(
                        Automative(
                            vahicleType: selectedOption1,
                            vahicleBrand: _brand.text,
                            vahicleCategory: _category.text,
                            vahicleColor: _color.text,
                            insuranceType: selectedOption2,
                            vahicleRegNo: _reg.text),
                      ),
                    ),
                  );
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
                Container(
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
                      const Text(
                        'Automative Insurance',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26.5),
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
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          constraints: BoxConstraints(minHeight: 60),
                          padding: EdgeInsets.symmetric(horizontal: 26.5),
                          child: TextFormField(
                            keyboardType: TextInputType.none,
                            showCursor: false,
                            controller: typeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "\u24D8 Select your vehicle Type";
                              }
                            },
                            onTap: () {
                              showRadioDailog1(context);
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              // fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: InputDecoration(
                              suffixIconConstraints:
                                  BoxConstraints(maxHeight: 65, maxWidth: 40),
                              suffixIcon: Container(
                                width: 100,
                                height: 65,
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/downBlack.svg",
                                    color: Color(0xFF939EAA),
                                  ),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              label: Container(
                                child: Text(
                                  "Vehicle Type",
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
                                    color: Color(0xFFDBE9F5),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        customTextField(
                            context, "Vehicle Brand", _brand, false),
                        customTextField(
                            context, "Vehicle Category", _category, false),
                        customTextField(
                            context, "Vehicle Color", _color, false),
                        customTextField(
                            context, "Vehicle Registration No.", _reg, false),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width,
                              constraints: BoxConstraints(minHeight: 60),
                              padding: EdgeInsets.symmetric(horizontal: 26.5),
                              child: TextFormField(
                                keyboardType: TextInputType.none,
                                showCursor: false,
                                controller: imageTF[index],
                                onTap: () {
                                  _pickImage(
                                      imagePickerList[index], imageTF[index]);
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  // fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  suffixIcon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 12),
                                        child: Text(
                                          'Choose',
                                          style: TextStyle(
                                            color: Color(0xFFEF7C00),
                                            fontSize: 12,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // suffixText: "Choose",
                                  // suffixStyle: TextStyle(
                                  //   color: Color(0xFFEF7C00),
                                  //   fontSize: 12,
                                  //   fontWeight: FontWeight.w400,
                                  // ),
                                  label: Container(
                                    child: Text(
                                      "Vehicle Photo ${index + 1}",
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
                                        color: Color(0xFFDBE9F5),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width,
                          constraints: BoxConstraints(minHeight: 60),
                          padding: EdgeInsets.symmetric(horizontal: 26.5),
                          child: TextFormField(
                            keyboardType: TextInputType.none,
                            showCursor: false,
                            controller: insuranceController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "\u24D8 Select your insurance Type";
                              }
                            },
                            onTap: () {
                              showRadioDailog2(context);
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              // fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: InputDecoration(
                              suffixIconConstraints:
                                  BoxConstraints(maxHeight: 65, maxWidth: 40),
                              suffixIcon: Container(
                                width: 100,
                                height: 65,
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/downBlack.svg",
                                    color: Color(0xFF939EAA),
                                  ),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              label: Container(
                                child: Text(
                                  "Insurance Type",
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
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE9F5),
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
                                    color: Color(0xFFDBE9F5),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
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
