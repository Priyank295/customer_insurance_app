import 'dart:io';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/customTextField.dart';
import 'package:image_picker/image_picker.dart';

class OfficeInsuranceScreen3 extends StatefulWidget {
  static const officeScreen3 = "/officeScreen3";
  const OfficeInsuranceScreen3({super.key});

  @override
  State<OfficeInsuranceScreen3> createState() => _OfficeInsuranceScreen3State();
}

TextEditingController _resident = TextEditingController();
TextEditingController _company = TextEditingController();
TextEditingController _emp = TextEditingController();
TextEditingController _any = TextEditingController();
File _propertyFile = File("");

final formKey = GlobalKey<FormState>();
bool allValidate = true;
String selectedOption = '';

List<ImagePicker> imgList = [
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
  ImagePicker(),
];
List<File> imgFile = [
  File(""),
  File(""),
  File(""),
  File(""),
  File(""),
  File(""),
  File(""),
  File(""),
  File(""),
  File(""),
];

class _OfficeInsuranceScreen3State extends State<OfficeInsuranceScreen3> {
  Future<void> _pickImage(ImagePicker imgPicker, File file) async {
    final pickedImage = await imgPicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File file2 = File(pickedImage.path);
      setState(() {
        file = file2;
      });
    }
  }

  Future _selectProperty() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      setState(() {
        _propertyFile = File(result.files.single.path.toString());
      });
    } else {
      // User canceled the picker
    }
  }

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
                    _any.text = selectedOption;

                    // isFilled = true;
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
                    _any.text = selectedOption;

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 33),
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 55,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFDBE9F5)),
                    borderRadius: BorderRadius.circular(27.50),
                  ),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    "assets/edit.svg",
                    color: AppColors.vectorPrimaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Edit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFEF7C00),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "/officePlansScreen");
                  } else {
                    setState(() {
                      allValidate = false;
                    });
                  }
                },
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 26),
                  child: Container(
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
                        "Submit",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
                            controller: _resident,
                            name: "No. of Residents"),
                        CustomTextField2(
                            name: "Company Registration No.",
                            controller: _company,
                            phone: false),
                        CustomTextField2(
                            name: "No. of Employees",
                            controller: _emp,
                            phone: false),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 26),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                constraints: BoxConstraints(minHeight: 65),
                                child: TextFormField(
                                  onTap: () {
                                    showRadioDailog(context);
                                  },
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "\u24D8 Please enter ${"Any Protection system?".toLowerCase()} here";
                                    }
                                  },
                                  controller: _any,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    // fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  // onChanged: (value) {
                                  //   if (value.length > 0) {
                                  //     setState(() {
                                  //       isFilled = true;
                                  //     });
                                  //   } else {
                                  //     setState(() {
                                  //       isFilled = false;
                                  //     });
                                  //   }
                                  // },
                                  decoration: InputDecoration(
                                    suffixIconConstraints: BoxConstraints(
                                        maxHeight: 65, maxWidth: 40),
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
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    label: Container(
                                      child: Text(
                                        "Any Protection system?",
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: isFilled
                                              ? AppColors.filledTextFieldColor
                                              : AppColors.regularTextFieldColor,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5353),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.focusTextFieldColor,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _selectProperty();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 26.5, vertical: 10),
                            width: width,
                            height: 160,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFDBE9F5)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/upload.svg"),
                                SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  'Upload your Property Contract Here',
                                  style: TextStyle(
                                    color: Color(0xFF939EAA),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 21),
                          margin: EdgeInsets.symmetric(
                              horizontal: 26.5, vertical: 10),
                          width: width,
                          // height: 171,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFDBE9F5)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: DynamicHeightGridView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            crossAxisCount: 4,
                            crossAxisSpacing: 17,
                            mainAxisSpacing: 22,
                            builder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  final pickedImage = await imgList[index]
                                      .pickImage(source: ImageSource.gallery);

                                  if (pickedImage != null) {
                                    File file2 = File(pickedImage.path);
                                    setState(() {
                                      imgFile[index] = file2;
                                    });
                                  }
                                },
                                child: imgFile[index].path.length == 0
                                    ? SvgPicture.asset("assets/no_photo2.svg")
                                    : Stack(
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 65,
                                            padding: EdgeInsets.all(5),
                                            decoration: ShapeDecoration(
                                              image: DecorationImage(
                                                  image: FileImage(
                                                    imgFile[index],
                                                  ),
                                                  fit: BoxFit.cover),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  imgFile[index] = File("");
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                  "assets/close3.svg"),
                                            ),
                                          ),
                                        ],
                                      ),
                              );
                            },
                          ),
                        )
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
