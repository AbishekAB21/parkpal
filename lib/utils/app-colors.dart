import 'package:flutter/material.dart';

AppColor appcolor = AppDefaultColor();

abstract class AppColor {
  final Color primaryColor;
  final Color secondaryColor;
  final Color teritiaryColor;
  final Color textfieldColor;
  final Color backgroundColor;
  final Color unselectedColor;
  final Color AuthContainerColor;
  final Color buttonColor;
  final Color successColor;
  final Color errorColor;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color borderColor;
  final Color borderColor2;

  AppColor({
    required this.primaryColor,
    required this.secondaryColor,
    required this.teritiaryColor,
    required this.textfieldColor,
    required this.backgroundColor,
    required this.unselectedColor,
    required this.AuthContainerColor,
    required this.buttonColor,
    required this.successColor,
    required this.errorColor,
    required this.gradientColor1,
    required this.gradientColor2,
    required this.borderColor,
    required this.borderColor2,
  });
}

class AppDefaultColor extends AppColor {
  AppDefaultColor()
      : super(
          primaryColor: Colors.white,
          secondaryColor: Colors.grey.shade300,
          teritiaryColor: Colors.grey.shade400,
          textfieldColor: Colors.grey[850]!,
          backgroundColor: Colors.grey.shade200,
          unselectedColor: Colors.grey.shade500,
          AuthContainerColor: Colors.black54,
          buttonColor: Colors.black,
          successColor: Colors.green,
          errorColor: Colors.red,
          gradientColor1: Color(0xFF191970),
          gradientColor2: Color(0xFF8A2BE2),
          borderColor: Colors.white70,
          borderColor2: Colors.white,
        );
}
