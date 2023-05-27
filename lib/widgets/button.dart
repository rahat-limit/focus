import 'package:flutter/material.dart';
import 'package:focus/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  const CustomButton({super.key, this.text = 'Next', required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40)),
        onPressed: callback,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold, fontFamily: 'ledger'),
        ));
  }
}
