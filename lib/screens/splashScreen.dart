import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

import 'languageSelectionScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String splashScreen = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future delay(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 3000)).then((vaue) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (ctx) => const LanguageSelectionScreen()));
    });
  }

  @override
  void initState() {
    delay(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset("assets/logo.svg")),
    );
  }
}
