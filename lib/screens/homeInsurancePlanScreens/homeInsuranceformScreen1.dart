import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/mainBtn.dart';
import 'homeInsuranceformScreen2.dart';

class HomeInsuranceFormScreen1 extends StatefulWidget {
  static const HomeForm1 = "/homeForm1";
  const HomeInsuranceFormScreen1({super.key});

  @override
  State<HomeInsuranceFormScreen1> createState() =>
      _HomeInsuranceFormScreen1State();
}

//Create an instance of ScreenshotController
ScreenshotController screenshotController = ScreenshotController();

// const pdf = pdfWidgets.Document;

// shareImage() async {
//   final uint8List = await screenshotController.capture();
//   String tempPath = (await getTemporaryDirectory()).path;
//   String fileName = "myFile";
//   if (await Permission.storage.request().isGranted) {
//     File file = await File('$tempPath/$fileName.png').create();
//     file.writeAsBytesSync(uint8List!);
//     await Share.shareFiles([file.path]);
//   }
// }

Future screenToPdf(String fileName, Uint8List screenShot) async {
  pw.Document pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Expanded(
          child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
        );
      },
    ),
  );
  String path = (await getTemporaryDirectory()).path;
  File pdfFile = await File('$path/$fileName.pdf').create();

  pdfFile.writeAsBytesSync(await pdf.save());
  await Share.shareFiles([pdfFile.path]);
}

Uint8List _imageFile = Uint8List.fromList([0, 2, 5, 7, 42, 255]);

class _HomeInsuranceFormScreen1State extends State<HomeInsuranceFormScreen1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 44, left: 29, right: 29),
            width: width,
            // height: height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset("assets/back.svg")),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'Home Insurance',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        'Policy Details',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFEF7C00),
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7, bottom: 41),
                      width: double.infinity,
                      height: 3,
                      decoration: BoxDecoration(
                          color: Color(0xFFEF7C00),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    Text(
                      'Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail Form Detail',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // SvgPicture.asset(
                    //   "assets/homeForm.svg",
                    //   width: MediaQuery.of(context).size.width,
                    // ),

                    Screenshot(
                      controller: screenshotController,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: .75,
                                  ),
                                  color: Colors.transparent),
                              child: Row(
                                children: [
                                  //policy
                                  Container(
                                    width: width / 5.5,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Policy No.",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width / 3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                  ),

                                  //Issue Date
                                  Container(
                                    width: width / 5.5,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Issue Date",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 3,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Name of the Insured",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 4,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Sum Insured",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: .75,
                                  ),
                                  color: Colors.transparent),
                              child: Row(
                                children: [
                                  //policy
                                  Container(
                                    width: width / 5,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Type of Cover",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width / 3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                  ),

                                  Container(
                                    width: width / 6,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Intrest",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 5.5,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Conditions",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 4.5,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Exclusions",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 4.3,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Deductible",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 3.5,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Geographical Area",
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 3,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Laws and Jurisdictions",
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: .75,
                                  ),
                                  color: Colors.transparent),
                              child: Row(
                                children: [
                                  //policy
                                  Container(
                                    width: width / 4.5,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Net Premium",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width / 3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                  ),

                                  Container(
                                    width: width / 9,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Tax",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  //policy
                                  Container(
                                    width: width / 5.3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Issue Fees",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width / 3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                  ),

                                  Container(
                                    width: width / 6,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                        "Stamps",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  left: BorderSide(
                                      color: Colors.black, width: 0.75),
                                  bottom: BorderSide(
                                      color: Colors.black, width: 0.75),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(children: [
                                Container(
                                  width: width / 4.3,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: .75,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Gross Premium",
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        child: SvgPicture.asset("assets/page1.svg")),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      HomeInsuranceFormScreen2()));
                          // screenshotController.capture().then((image) {
                          //   setState(() {
                          //     _imageFile = image!;
                          //   });
                          //   //Capture Done
                          // }).catchError((onError) {
                          //   print(onError);
                          // });

                          // screenToPdf("Home", _imageFile).then((value) {

                          // });
                        },
                        child: MainButton(context, "Next")),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: height,
                  width: width,
                  margin: const EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-0.68),
                        child: Text(
                          'DRAFT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0x19EF7B00),
                            fontSize: 80,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                          ),
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
