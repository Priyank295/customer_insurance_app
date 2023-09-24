import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/bottom_nav_button.dart';

class ConditionsScreen extends StatefulWidget {
  static const conditionsScreen = '/conditionsScreen';
  const ConditionsScreen({super.key});

  @override
  State<ConditionsScreen> createState() => _ConditionsScreenState();
}

class _ConditionsScreenState extends State<ConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          BottomNavOneButton(context, "I Agree", "/createPasswordScreen"),
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
                  padding: EdgeInsets.symmetric(horizontal: 29, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'This mobile application “iInsure” (the “App”) is made available by ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Soteria Insurance Solutions,',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' a Trade Mark owned by ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Al-Netaq Insuranc e Solutions,',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' a limited liability company and registered in Jordan with number 16614 and with registered address 75 Al-Kofa Street; Um Othayna District, Amman - Jordan ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '(“Soteria Insurance Solutions” “Al-Neta Insurance Solutions”,',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' “us”, “we” or “our”).You, the user of the App, confirm your acceptance of these App terms of use (“App Terms”). If you do not agree to these App Terms, you must immediately uninstall the App discontinue its use.  These App Terms should be read alongside our Privacy Policy and Cookie Policy and Refund &amp; Cancellation Policy.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'GENERAL TERMS',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'APP AND RELATED TERMS',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        'Depending on the version of the Application you have downloaded, these App Terms incorporate Apple’s or Google Android’s terms and conditions and privacy policies (“Platform Terms”). If there is any conflict between these App Terms and the Platform Terms then these App Terms will prevail. We may from time to time vary these App Terms. Please check these App Terms regularly to ensure you are aware of any variations made by us. If you continue to use this App, you are deemed to have accepted such variations. If you do not agree to such variations, you should not use the App.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'USE OF THE APP',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        'You must be at least 18 years of age and resident in the HASHMITE KINGDOM OF JORDAN to use the App. Soteria Insurance Solutions hereby grants you a non-exclusive, non-transferable, revocable license to use the App for your personal, non-commercial use and only on an Apple or Android device (“Device”) as permitted by the applicable Platform Terms and in accordance with these App Terms (“User License”). All other rights in the App are reserved by Soteria Insurance Solutions. In the event of your breach of these App Terms we will be entitled to terminate the User License immediately. You acknowledge that your agreement with your mobile network provider (“Mobile Provider”) will apply to your use of the App. You acknowledge that you may be charged by the Mobile Provider for data services while using certain features of the App or any such third party charges as may arise and you accept responsibility for such charges. If you are not the bill payer for the Device being used to access the App, you will be assumed to have received permission from the bill payer for using the App. You acknowledge that where you use services provided by Apple or Google (or any other third parties) in connection with your use of the App, you will be subject to Apple’s, Google’s (or the applicable third party’s) terms and conditions and privacy policy and you should ensure that you have read such terms.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
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
