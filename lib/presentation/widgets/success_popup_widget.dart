import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessPopUpWidget extends StatelessWidget {
  const SuccessPopUpWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Lottie.asset(
            'assets/green_tick.json',
            repeat: true,
            reverse: true,
            animate: true,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(title),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
