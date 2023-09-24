import 'package:flutter/material.dart';

class AppColors {
  // static const primaryColor =
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [Color(0xFF0D47A1), Color(0xFF0A2472)],
  );
  static LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [Color(0xFF0D47A1), Color(0xFF0A2472)],
  );

  static const Color fontPrimaryColor = Color(0xFF939EAA);
  static const Color fontSecondaryColor = Color(0xFF008EFF);
  static const Color borderPrimaryColor = Color(0xFFDBE9F5);
  static const Color vectorPrimaryColor = Color(0xFF2255A4);
  static const Color vectorSecondaryColor = Color(0xff939EAA);
  static const Color focusTextFieldColor = Color(0xFF008EFF);
  static const Color filledTextFieldColor = Color(0xFF0A2472);
  static const Color regularTextFieldColor = Color(0xFFDBE9F5);
}
