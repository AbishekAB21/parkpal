import 'package:flutter/material.dart';
import 'package:parkpal/provider/bottom-nav-provider.dart';
import 'package:parkpal/provider/database-provider.dart';
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
    final _bottomNavProvider = Provider.of<BottomNavProvider>(context);
    final _dbProvider = Provider.of<DatabaseProvider>(context);
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
                  "Signed in as : ${_dbProvider.email}",
                  style: Fontstyles.HeadlineStyle2(context),
                ),
                SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  title: "Sign out",
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(
                            "Are you sure about that?",
                            style: Fontstyles.HeadlineStyle3(context),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: Fontstyles.ContentTextStyle3(context),
                                )),
                            TextButton(
                                onPressed: () {
                                  _auth.signOutUser(context);
                                  _bottomNavProvider.setIndex(0);
                                },
                                child: Text(
                                  "Sign out",
                                  style: Fontstyles.ContentTextStyle3(context),
                                ))
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
