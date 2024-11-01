import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class ReusableTextfield extends StatelessWidget {
  final TextEditingController cntrlr;
  final Icon prefixicon;
  final String title;
  final bool isObscure;
  final String? Function(String?)? validator; // Add validator

  ReusableTextfield({
    super.key,
    required this.prefixicon,
    required this.title,
    required this.cntrlr,
    required this.isObscure,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: appcolor.unselectedColor,
      ),
      child: TextFormField(
        controller: cntrlr,
        style: Fontstyles.ContentTextStyle3(context),
        obscureText: isObscure,
        validator: validator, // Add validation here
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: appcolor.textfieldColor),
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: appcolor.borderColor2),
          ),
          hintText: title,
          hintStyle: Fontstyles.lightTextStyle(context),
          label: Text(
            title,
            style: Fontstyles.lightTextStyle(context),
          ),
          prefixIcon: prefixicon,
          prefixIconColor: appcolor.borderColor,
        ),
      ),
    );
  }
}
