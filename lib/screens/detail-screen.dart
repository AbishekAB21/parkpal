// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:parkpal/provider/database-provider.dart';
import 'package:parkpal/provider/slot-provider.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/reusable-buttonII.dart';
import 'package:parkpal/widgets/slot-container.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class DetailScreen extends StatelessWidget {
  String slotName;
  DetailScreen({super.key, required this.slotName});

  @override
  Widget build(BuildContext context) {
    final slotProvider = Provider.of<SlotProvider>(context);
    final dbProvider = Provider.of<DatabaseProvider>(context);

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
                  slotName,
                  style: Fontstyles.HeadlineStyle0(context),
                ),
                SizedBox(
                  height: 50,
                ),

                // Slots

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlotTiles(
                        time: "10 mins",
                        ontap: () {
                          slotProvider.calculatePrice(10);
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    SlotTiles(
                        time: "1 hour  ",
                        ontap: () {
                          slotProvider.calculatePrice(1);
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    SlotTiles(
                        time: "2 hours",
                        ontap: () {
                          slotProvider.calculatePrice(2);
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    SlotTiles(
                        time: "3 hours",
                        ontap: () {
                          slotProvider.calculatePrice(3);
                        }),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Parking for longer? ",
                      style: Fontstyles.ContentTextStyle(context),
                    ),
                    Text(
                      "Contact us",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: appcolor.successColor,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: appcolor.backgroundColor,
          child: Center(
            child: ReusableButtonII(price: "${slotProvider.price}", ontap: (){

              // Save to Active bookings cart and update isbooked to true
              Map<String,dynamic> activeBookings = {
                "slotName" : slotName,
                "price" : slotProvider.price,
                "date" : DateTime.now().toIso8601String(),
                "bookingId" : randomAlphaNumeric(10),
              };
              dbProvider.addToActiveBookings(activeBookings, context);
            })
          ),
        ),
      ),
    );
  }
}
