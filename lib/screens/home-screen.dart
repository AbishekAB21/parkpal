import 'package:flutter/material.dart';
import 'package:parkpal/provider/database-provider.dart';
import 'package:parkpal/widgets/loading-lottie.dart';
import 'package:parkpal/widgets/parking-slot-builder.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 40,
                    width: 40,
                    color: appcolor.successColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "ParkPal",
                    style: Fontstyles.logoTextstyle2(context),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Consumer<DatabaseProvider>(
                  builder: (context, provider, child) {
                    return StreamBuilder<List<Map<String, dynamic>>>(
                      stream: provider.getSlotsStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return LoadingLottie();
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error loading slots'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No slots available'));
                        } else {
                          final slots = snapshot.data!;
                          return GridView.builder(
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: slots.length,
                            itemBuilder: (context, index) {
                              final slot = slots[index];
                              return SlotBuilder(
                                slotName: slot['slotName'] ?? 'Unnamed Slot',
                                isBooked: slot['isbooked'] ?? false,
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
