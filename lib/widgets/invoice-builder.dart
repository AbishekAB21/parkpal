import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:parkpal/provider/database-provider.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/reusable-button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InvoiceBuilder extends StatelessWidget {
  final String bookingId;

  InvoiceBuilder({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context) {
    final _dbProvider = Provider.of<DatabaseProvider>(context);

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _dbProvider.getActiveBookingsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No booking details available"));
        }

       
        final bookingData = snapshot.data!.firstWhere(
          (booking) => booking['bookingId'] == bookingId,
          orElse: () => {},
        );

        if (bookingData.isEmpty) {
          return Center(child: Text("No booking found for this ID"));
        }

        final slotName = bookingData['slotName'] ?? "N/A";
        final bookingTime = (bookingData['bookingTime'] as Timestamp).toDate();
        final releaseTime = DateTime.now();
        final totalCost = _dbProvider
            .calculateCost(bookingTime, releaseTime)
            .toStringAsFixed(1);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Slot name",
                              style: Fontstyles.ContentTextStyle(context)),
                          Text(slotName,
                              style: Fontstyles.ContentTextStyle(context)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Booking time",
                              style: Fontstyles.ContentTextStyle(context)),
                          Text(DateFormat('hh:mm a').format(bookingTime),
                              style: Fontstyles.ContentTextStyle(context)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Release time",
                              style: Fontstyles.ContentTextStyle(context)),
                          Text(DateFormat('hh:mm a').format(releaseTime),
                              style: Fontstyles.ContentTextStyle(context)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total cost",
                              style: Fontstyles.HeadlineStyle2(context)),
                          Text("\$$totalCost",
                              style: Fontstyles.HeadlineStyle2(context)),
                        ],
                      ),
                      SizedBox(height: 30),
                      ReusableButton(
                        title: "Pay",
                        ontap: () {
                          // Call freeUpSlots 
                          _dbProvider.freeUpSlots(context, bookingId);
                          Navigator.pop(context);

                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
