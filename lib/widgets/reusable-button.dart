// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  void Function()? ontap;
  ReusableButton({super.key, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: appcolor.successColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          title,
          style: Fontstyles.ButtonText1(context),
        )),
      ),
    );
  }
}