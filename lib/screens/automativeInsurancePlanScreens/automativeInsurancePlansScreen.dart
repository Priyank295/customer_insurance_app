import 'package:flutter/material.dart';

import '../../widgets/CustomAppbar.dart';
import 'automativeInsuranceFormScreen1.dart';

class AutomativeInsurancePlansScreen extends StatefulWidget {
  static const String automativePlansScreen = '/automativePlansScreen';
  const AutomativeInsurancePlansScreen({super.key});

  @override
  State<AutomativeInsurancePlansScreen> createState() =>
      _AutomativeInsurancePlansScreenState();
}

final List<Map<String, String>> planData = [
  {
    "name": "LIC",
    "icon": "assets/lic2.png",
  },
  {
    "name": "LIC",
    "icon": "assets/lic2.png",
  },
  {
    "name": "BIRLA SUN LIFE",
    "icon": "assets/birla2.png",
  },
  {
    "name": "BIRLA SUN LIFE",
    "icon": "assets/birla2.png",
  },
  {
    "name": "ADITYA BIRLA HEALTH",
    "icon": "assets/aditya.png",
  },
  {
    "name": "ADITYA BIRLA HEALTH",
    "icon": "assets/aditya.png",
  },
];

class _AutomativeInsurancePlansScreenState
    extends State<AutomativeInsurancePlansScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: width,
            child: Column(children: [
              CustomPolicyAppBar(context, "Automative Insurance Plan"),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: planData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return planWidget(context, planData[index]);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget planWidget(context, Map<String, String> data) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => const AutomativeInsuranceFormScreen1()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 26.5, vertical: 7.5),
        padding: EdgeInsets.only(left: 15, top: 18, bottom: 18, right: 8),
        constraints: BoxConstraints(minHeight: 136),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFB9D8FF)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 83,
                  width: 83,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      data["icon"].toString(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 83,
                  child: Text(
                    data["name"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
            SizedBox(
              width: 19,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LIC Secure Home Plan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Unlimited offers for you and your family \nUnlimited offers for you',
                      style: TextStyle(
                        color: Color(0xFF939EAA),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '₹ 1 Lakh Term Plan',
                    style: TextStyle(
                      color: Color(0xFF2255A4),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Starting from ₹1/month',
                    style: TextStyle(
                      color: Color(0xFFD6B268),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
