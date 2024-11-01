import 'package:flutter/material.dart';
import 'package:parkpal/provider/authentication-provider.dart';
import 'package:parkpal/screens/signup-screen.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/reusable-button.dart';
import 'package:parkpal/widgets/reusable-textfield.dart';
import 'package:provider/provider.dart';

class LogInBox extends StatelessWidget {
  const LogInBox({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>(); // Form key
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
        child: Form(
          key: formKey, 
          child: Column(
            children: [
              Text(
                "First thing's first, let's log you in.",
                style: Fontstyles.ButtonText1(context),
              ),
              SizedBox(height: 20),

              // Email 
              ReusableTextfield(
                prefixicon: Icon(Icons.mail_rounded),
                title: "Email",
                cntrlr: emailController,
                isObscure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Password 
              ReusableTextfield(
                prefixicon: Icon(Icons.password_rounded),
                title: "Password",
                cntrlr: passwordController,
                isObscure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              // Sign-in Button
              ReusableButton(
                title: "Sign in",
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    authProvider.signInUser(
                      emailController.text,
                      passwordController.text,
                      context,
                    );
                  }
                },
              ),
              
              // Divider 
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(color: appcolor.borderColor),
              ),
              SizedBox(height: 10),
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
                        ),
                      );
                    },
                    child: Text(
                      " Sign up",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: appcolor.successColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
