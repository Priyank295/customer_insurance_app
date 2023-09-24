import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/colors.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/mainBtn.dart';

class HomeInsuranceScreen3 extends StatefulWidget {
  static const HomeScreen3 = "/homeScreen3";
  const HomeInsuranceScreen3({super.key});

  @override
  State<HomeInsuranceScreen3> createState() => _HomeInsuranceScreen3State();
}

TextEditingController _building = new TextEditingController();
TextEditingController _block = new TextEditingController();
TextEditingController _plate = new TextEditingController();
TextEditingController _plot = new TextEditingController();
TextEditingController _resident = new TextEditingController();
final formKey = GlobalKey<FormState>();

bool allValidate = true;

class _HomeInsuranceScreen3State extends State<HomeInsuranceScreen3> {
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
                    Navigator.pushNamed(context, "/homePlansScreen");
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
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: SvgPicture.asset("assets/3of3.svg"),
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
                          child: Column(
                            children: [
                              Text(
                                'We need some more info. of yours',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Do not worry! Your details are completely safe here!',
                                style: TextStyle(
                                  color: Color(0xFF939EAA),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        customTextField(
                            context, "Building No.", _building, false),
                        customTextField(context, "Block No.", _block, false),
                        customTextField(context, "Plate No.", _plate, false),
                        customTextField(context, "Plot No.", _plot, false),
                        customTextField(
                            context, "No. of Residents", _resident, false),
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

//   Widget customTextField(context, String name, String icon) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: MediaQuery.of(context).size.width,
//       height: 65,
//       padding: EdgeInsets.symmetric(horizontal: 26),
//       child: TextFormField(
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 18,
//           // fontFamily: 'Nunito',
//           fontWeight: FontWeight.w700,
//         ),
//         decoration: InputDecoration(
//           isDense: true,
//           suffixIconConstraints: BoxConstraints(maxHeight: 65, maxWidth: 40),
//           suffixIcon: icon.length != 0
//               ? Container(
//                   width: 100,
//                   height: 65,
//                   child: Center(
//                     child: SvgPicture.asset(
//                       icon,
//                       color: Color(0xFF939EAA),
//                     ),
//                   ),
//                 )
//               : null,
//           contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//           label: Container(
//             child: Text(
//               name,
//               style: GoogleFonts.nunito(
//                 color: Color(0xFF939EAA),
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color(0xFFDBE9F5),
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(10)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color(0xff008EFF),
//                 width: 0.5,
//               ),
//               borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//     );
//   }
}
