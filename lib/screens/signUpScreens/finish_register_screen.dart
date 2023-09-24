import 'package:customer_insurance_app/widgets/bottom_nav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinishRegisterScreen extends StatefulWidget {
  const FinishRegisterScreen({super.key});

  @override
  State<FinishRegisterScreen> createState() => _FinishRegisterScreenState();
}

class _FinishRegisterScreenState extends State<FinishRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(children: [
                SvgPicture.asset("assets/finish.svg"),
                SizedBox(
                  height: 27,
                ),
                Text(
                  'Congratulations!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  'Your account is succesfully created. You are now a part of our family. Our best services are waiting for you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF939EAA),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
            ),
            BottomNavOneButton(context, "Get Started", "/bottomNavScreens")
          ],
        ),
      )),
    );
  }
}
