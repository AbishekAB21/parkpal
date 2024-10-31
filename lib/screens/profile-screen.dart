import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/reusable-button.dart';
import 'package:provider/provider.dart';

import '../provider/authentication-provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
        backgroundColor: appcolor.backgroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  foregroundColor: appcolor.successColor,
                  backgroundImage: AssetImage("assets/gorilla.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign in as : test@gmail.com",
                  style: Fontstyles.HeadlineStyle2(context),
                ),
                SizedBox(height: 20,),
                ReusableButton(title: "Sign out",ontap: () {
                  _auth.signOutUser(context);
                },)
              ],
            ),
          ),
        ));
  }
}
