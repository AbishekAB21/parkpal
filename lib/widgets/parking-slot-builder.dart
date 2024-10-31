import 'package:flutter/material.dart';
import 'package:parkpal/screens/detail-screen.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';
import 'package:parkpal/widgets/reusable-snackbar.dart';

class SlotBuilder extends StatelessWidget {
  final String slotName;
  final bool isBooked;

  const SlotBuilder({Key? key, required this.slotName, required this.isBooked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isBooked
            ? ReusableSnackbar().showSnackbar(
                context, "Uh-oh! slot not available!", appcolor.errorColor)
            : Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(slotName: slotName,)),
              );
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: appcolor.secondaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    "assets/parking-image2.png",
                    fit: BoxFit.contain,
                    height: 20,
                    width: 120,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  slotName,
                  style: Fontstyles.ContentTextStyle(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 2),
              Text(
                isBooked ? 'Booked' : 'Available',
                style: TextStyle(
                  color: isBooked ? appcolor.errorColor : appcolor.successColor,
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
