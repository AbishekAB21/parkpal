// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class ReusableTextfield extends StatelessWidget {
  TextEditingController cntrlr;
  Icon prefixicon;
  String title;
  bool isObscure;

   ReusableTextfield({super.key, required this.prefixicon, required this.title, required this.cntrlr, required this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appcolor.unselectedColor
              ),
              child: TextFormField(
                controller: cntrlr,
                style: Fontstyles.ContentTextStyle3(context),
                obscureText: isObscure,
                decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: appcolor.textfieldColor)),
            isDense: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: appcolor.borderColor2)),
            hintText: title,
            hintStyle: Fontstyles.lightTextStyle(context),
            label: Text(
              title,
              style: Fontstyles.lightTextStyle(context),
            ),
            hintFadeDuration: Durations.medium2,
            prefixIcon: prefixicon,
            prefixIconColor: appcolor.borderColor
            ),
              ),
            );
  }
}