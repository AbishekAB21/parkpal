import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class SlotTiles extends StatelessWidget {
  String time;
  Function()? ontap;
  SlotTiles({super.key, required this.time, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: appcolor.teritiaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          time,
          style: Fontstyles.ContentTextStyle2(context),
        ),
      ),
    );
  }
}
