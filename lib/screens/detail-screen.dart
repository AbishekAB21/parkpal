import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.backgroundColor,
        appBar: AppBar(
          backgroundColor: appcolor.backgroundColor,
          iconTheme: IconThemeData(color: appcolor.buttonColor),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                    child: Center(
                        child: Image.asset(
                  "assets/parking-image2.png",
                  height: 300,
                  width: 300,
                ))),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "A-15",
                  style: Fontstyles.HeadlineStyle0(context),
                ),

                // Add slider here
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: appcolor.backgroundColor,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.successColor),
              child: Center(
                child: Text(
                  "Pay \$100 and Book",
                  style: Fontstyles.ButtonTextLarge(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
