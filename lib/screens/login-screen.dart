 import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/login-box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset(
                "assets/logo.png",
                height: 60,
                width: 60,
                color: appcolor.successColor,
              )),
              SizedBox(height: 10,),
              Text(
                "ParkPal.",
                style: Fontstyles.logoTextstyle(context),
              ),
              SizedBox(
                height: 20,
              ),
              LogInBox()
            ],
          ),
        ),
      ),
    );
  }
}
