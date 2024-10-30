import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class ReusableButtonII extends StatelessWidget {
  final String price;
  final Function()? ontap;
  const ReusableButtonII({super.key, required this.price, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return Container(
            child: null
          );
        },);
      },
      child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appcolor.successColor),
                child: Center(
                  child: Text(
                    "Pay \$$price and Book",
                    style: Fontstyles.ButtonTextLarge(context),
                  ),
                ),
              ),
    );
  }
}