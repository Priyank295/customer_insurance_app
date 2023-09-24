import 'package:camera/camera.dart';
import 'package:customer_insurance_app/common/colors.dart';
import 'package:customer_insurance_app/models/user.dart';
import 'package:customer_insurance_app/screens/signUpScreens/conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/bottom_nav_button.dart';

class SignUpIDScannerScreen extends StatefulWidget {
  final User user;
  // final String full_name;
  // final String email;
  // final String mobile_no;
  // final String occupation;
  // final String gender;
  // final String address;
  // final String dob;
  // final String housenoandbuildingname;
  // final String street;
  // final String country;
  // final String city;
  // final String state;
  // final String district;
  // final String national_id;
  // final String road_name;
  // final String house_no;
  // final String phone;

  SignUpIDScannerScreen({required this.user});

  // required this.full_name,
  // required this.email,
  // required this.address,
  // required this.city,
  // required this.country,
  // required this.dob,
  // required this.district,
  // required this.gender,
  // required this.house_no,
  // required this.housenoandbuildingname,
  // required this.mobile_no,
  // required this.national_id,
  // required this.occupation,
  // required this.road_name,
  // required this.state,
  // required this.street,
  // required this.phone

  @override
  State<SignUpIDScannerScreen> createState() => _SignUpIDScannerScreen();
}

class _SignUpIDScannerScreen extends State<SignUpIDScannerScreen> {
  List<CameraDescription> cameras = [];
  CameraController? _controller;
  Future<void> initCamera() async {
    cameras = await availableCameras();
  }

  Future<void> startCamera() async {
    _controller = CameraController(cameras[0], ResolutionPreset.ultraHigh);

    try {
      await _controller!.initialize();
    } catch (e) {
      // Handle camera initialization errors
      print('Error starting camera: $e');
    }

    if (!mounted) return;

    setState(() {
      // Update the UI state to reflect the camera preview
    });

    await _controller!.buildPreview();
  }

  @override
  void initState() {
    super.initState();
    initCamera().then((_) {
      startCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 33, top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 26.5),
          child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => ConditionsScreen(widget.user)));
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
                    "Save & Next",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ))),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        'Personal Details',
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
                  width: width,
                  // height: height,
                  padding: const EdgeInsets.symmetric(horizontal: 29.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 39),
                        child: Column(
                          children: [
                            Text(
                              'Scan Document',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Please scan image of an ID that you have added in previous page.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF939EAA),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 285,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              "assets/scanner.svg",
                              width: double.infinity,
                            ),
                            FutureBuilder(
                              future: null,
                              builder: (context, snapshot) {
                                return _controller == null
                                    ? Center(child: CircularProgressIndicator())
                                    : Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: 260,
                                                width: 360,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: CameraPreview(
                                                    _controller!)),
                                          ],
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
