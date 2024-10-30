import 'package:flutter/material.dart';
import 'package:parkpal/functions/auth-page.dart';
import 'package:parkpal/screens/login-screen.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   goHome(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomStart,
                colors: [appcolor.backgroundColor, appcolor.unselectedColor])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 60,
              width: 60,
              color: appcolor.successColor,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "ParkPal.",
              style: Fontstyles.logoTextstyle(context),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> goHome(BuildContext context) async {
  await Future.delayed(Duration(seconds: 3));
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AuthPage(),
      ));
}
