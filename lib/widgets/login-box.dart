import 'package:flutter/material.dart';
import 'package:parkpal/screens/signup-screen.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/reusable-button.dart';
import 'package:parkpal/widgets/reusable-textfield.dart';


class LogInBox extends StatelessWidget {
  const LogInBox({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // final authProvider = Provider.of<AuthenticationProvider>(context);
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 55),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: appcolor.AuthContainerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              "First thing's first, let's log you in.",
              style: Fontstyles.ButtonText1(context),
            ),
            SizedBox(
              height: 20,
            ),

            // Textfields
            ReusableTextfield(
              prefixicon: Icon(Icons.mail_rounded),
              title: "Email",
              cntrlr: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextfield(
              prefixicon: Icon(Icons.password_rounded),
              title: "Password",
              cntrlr: passwordController,
            ),

            // Button
            SizedBox(
              height: 30,
            ),
            ReusableButton(title: "Sign in", ontap: () {
              // authProvider.signin(emailController.text, passwordController.text, context);
            }),

            // Divider
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: appcolor.borderColor,
              ),
            ),

            //Sign up Navigation
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: Fontstyles.ButtonText1(context),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                  },
                  child: Text(" Sign up",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: appcolor.successColor,
                          fontWeight: FontWeight.w600)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
