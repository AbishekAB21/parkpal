import 'package:flutter/material.dart';
import 'package:parkpal/provider/authentication-provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: Center(
        child:IconButton(onPressed: (){
          _auth.signOutUser(context);
        }, icon: Icon(Icons.logout_rounded)),
      ),
    );
  }
}