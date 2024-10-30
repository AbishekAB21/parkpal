import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class SlotBuilder extends StatelessWidget {
  const SlotBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: appcolor.primaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    "assets/parking-image2.png",
                    fit: BoxFit.contain,
                    height: 20,
                    width: 120,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                 "A-15",
                  style: Fontstyles.ContentTextStyle(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      );
  }
}