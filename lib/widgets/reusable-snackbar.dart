import 'package:flutter/material.dart';
import 'package:parkpal/utils/fontstyles.dart';

class ReusableSnackbar {
  showSnackbar(
    BuildContext context,
    String message,
    Color color,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Text(message, style: Fontstyles.ButtonText1(context),)));
  }
}
