import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/signup-box.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              appcolor.backgroundColor,
              appcolor.unselectedColor,
            ],
          ),
        ),
        child: Center(  
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 60,
                    width: 60,
                    color: appcolor.successColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "ParkPal.",
                    style: Fontstyles.logoTextstyle(context),
                  ),
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400), 
                    child: SignUpBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
