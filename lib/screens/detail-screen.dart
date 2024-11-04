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
  final String slotName;
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
                SizedBox(height: 20),
                Text(slotName, style: Fontstyles.HeadlineStyle0(context)),
                SizedBox(height: 50),
                // Pricing information
                PriceInfoTile(timeDetails: "10 minutes or less", price: "Free"),
                SizedBox(height: 10,),
                PriceInfoTile(timeDetails: "Every one hour", price: "\$100"),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: appcolor.backgroundColor,
          child: Center(
            child: ReusableButtonII(
              price: "Confirm booking",
              ontap: () {
                final bookingData = {
                  "slotName": slotName,
                  "price": slotProvider.price,
                  "date": DateTime.now().toIso8601String(),
                  "bookingId": randomAlphaNumeric(10),
                };
                dbProvider.bookSlots(bookingData, context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
