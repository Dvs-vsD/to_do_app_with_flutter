import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color btnColor;
  final Function()? onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: btnColor,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
