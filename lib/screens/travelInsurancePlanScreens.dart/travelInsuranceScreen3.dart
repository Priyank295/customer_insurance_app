import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/bottom_nav_button.dart';
import '../../widgets/mainBtn.dart';
import 'package:camera/camera.dart';

class TravelInsuranceScreen3 extends StatefulWidget {
  static const String TravelScreen3 = '/travelScreen3';
  const TravelInsuranceScreen3({super.key});

  @override
  State<TravelInsuranceScreen3> createState() => _TravelInsuranceScreen3State();
}

class _TravelInsuranceScreen3State extends State<TravelInsuranceScreen3> {
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
      bottomNavigationBar: BottomNavTwoButton(context, "/travelPlansScreen"),
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
                        'Travel Insurance',
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
                  child: SvgPicture.asset("assets/3of3.svg"),
                ),
                Container(
                  width: width,
                  // height: height,
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
                        height: 25,
                      ),
                      Container(
                        height: 285,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            SvgPicture.asset("assets/scanner.svg"),
                            FutureBuilder(
                              builder: (context, snapshot) {
                                return _controller == null
                                    ? Center(child: CircularProgressIndicator())
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 260,
                                              width: 360,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child:
                                                  CameraPreview(_controller!)),
                                        ],
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
