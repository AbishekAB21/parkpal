import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        "assets/Animation - 1730439027110.json",
        height: 200,
        width: 200,
        repeat: true,
        
      ),
    );
  }
}
