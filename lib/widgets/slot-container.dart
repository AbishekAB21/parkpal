// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class PriceInfoTile extends StatelessWidget {
  String timeDetails;
  String price;
   PriceInfoTile({super.key, required this.timeDetails, required this.price});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: appcolor.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timeDetails,
              style: Fontstyles.HeadlineStyle3(context),
            ),
            Text(
              price,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: appcolor.successColor,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
