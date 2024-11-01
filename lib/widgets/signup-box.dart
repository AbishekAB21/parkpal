import 'package:flutter/material.dart';
import 'package:parkpal/provider/authentication-provider.dart';
import 'package:parkpal/screens/login-screen.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/reusable-button.dart';
import 'package:parkpal/widgets/reusable-snackbar.dart';
import 'package:parkpal/widgets/reusable-textfield.dart';
import 'package:provider/provider.dart';

class SignUpBox extends StatelessWidget {
  const SignUpBox({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    final authProvider = Provider.of<AuthenticationProvider>(context);
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
              "New here ? Let’s get you signed up!",
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
              isObscure: false,
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextfield(
              prefixicon: Icon(Icons.password_rounded),
              title: "Password",
              cntrlr: passwordController,
              isObscure: true,
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextfield(
              prefixicon: Icon(Icons.password_rounded),
              title: "Confirm Password",
              cntrlr: confirmPasswordController,
              isObscure: true,
            ),

            // Button
            SizedBox(
              height: 30,
            ),
            ReusableButton(
                title: "Create Account",
                ontap: () {
                  if (passwordController.text ==
                      confirmPasswordController.text) {
                    authProvider.signUpUser(
                        emailController.text, passwordController.text, context);
                    emailController.clear();
                    passwordController.clear();
                    confirmPasswordController.clear();
                    
                  } else {
                    ReusableSnackbar().showSnackbar(
                        context, "Passwords don't match", appcolor.errorColor);
                  }
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

            //Sign in Navigation
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: Fontstyles.ButtonText1(context),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text(" Sign in",
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
