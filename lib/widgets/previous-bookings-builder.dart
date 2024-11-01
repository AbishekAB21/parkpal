// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:parkpal/provider/database-provider.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/loading-lottie.dart';
import 'package:provider/provider.dart';

class PreviousBookingsList extends StatelessWidget {
  const PreviousBookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseProvider = Provider.of<DatabaseProvider>(context);

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: databaseProvider.getPreviousBookingsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingLottie();
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/empty.png",
                height: 200,
                width: 200,
              ),
              Text(
                "No previous bookings",
                style: Fontstyles.ContentTextStyle2(context),
              ),
            ],
          ));
        }

        final previousBookings = snapshot.data!;

        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final booking = previousBookings[index];
            final slotName = booking['slotName'] ?? 'Unknown Slot';
            final bookingDate = booking['date'] ?? 'Unknown Date';

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
                        slotName,
                        style: Fontstyles.ContentTextStyle(context),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: appcolor.teritiaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Released',
                          style: Fontstyles.ButtonText3(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 0),
          itemCount: previousBookings.length,
        );
      },
    );
  }
}
