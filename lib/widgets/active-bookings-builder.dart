import 'package:flutter/material.dart';
import 'package:parkpal/provider/database-provider.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/invoice-builder.dart';
import 'package:parkpal/widgets/loading-lottie.dart';
import 'package:provider/provider.dart';

class ActiveBookingsList extends StatelessWidget {
  const ActiveBookingsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dbProvider = Provider.of<DatabaseProvider>(context);
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _dbProvider.getActiveBookingsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingLottie();
        }

        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
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
                "No active bookings",
                style: Fontstyles.ContentTextStyle2(context),
              ),
            ],
          ));
        }

        final activeBookings = snapshot.data!;

        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: activeBookings.length,
          separatorBuilder: (context, index) => SizedBox(height: 0),
          itemBuilder: (context, index) {
            final booking = activeBookings[index];
            final spotId = booking['slotName'] ?? "N/A";
            final bookingId = booking['bookingId'];
            final bookingTime = booking['bookingTime'];
           

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
                        spotId,
                        style: Fontstyles.ContentTextStyle(context),
                      ),
                      GestureDetector(
                        onTap: () {
                          /* Show a bottom sheet that has a button to 
                          make payment and details like an invoice */

                          showModalBottomSheet(
                            context: context,
                            
                            builder: (context) {
                              return BottomSheet(
                                elevation: 5 ,
                                showDragHandle: true,
                                enableDrag: true,
                                backgroundColor: appcolor.backgroundColor,
                                onClosing: () {},
                                builder: (context) {
                                  return InvoiceBuilder(bookingId: bookingId,);
                                },
                              );
                            },
                          );
                       
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: appcolor.errorColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Release Spot",
                            style: Fontstyles.ButtonText3(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
