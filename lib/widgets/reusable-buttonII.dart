import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

       

        // Showing Animation
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });

            return AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Center(
                child: LottieBuilder.asset(
                  "assets/Animation - 1730318130775.json",
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                  repeat: false,
                  
                ),
              ),
            );
          },
        );

        if (ontap != null) ontap!();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appcolor.successColor,
        ),
        child: Center(
          child: Text(
            price,
            style: Fontstyles.ButtonTextLarge(context),
          ),
        ),
      ),
    );
  }
}
