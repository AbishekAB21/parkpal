import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/authentication-provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: Center(
        child: IconButton(onPressed: (){
          _auth.signOutUser(context);
        }, icon: Icon(Icons.logout)),
      ),
    );
  }
}