import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class ActiveBookingsList extends StatelessWidget {
  const ActiveBookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/parking-image2.png",
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      "A-1",
                      style: Fontstyles.ContentTextStyle(context),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: appcolor.errorColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Relsease Spot",
                          style: Fontstyles.ButtonText3(context),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 0,
            ),
        itemCount: 15);
  }
}
