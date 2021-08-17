import 'package:flutter/material.dart';
import 'package:money_app/constants.dart';

class ReusableIconButton extends StatelessWidget {
  const ReusableIconButton({
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  final Function() onPressed;
  final String text;
  final Stack icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        child: Column(
          children: [
            icon,
            Text(
              text,
              style: kReusableButtonText,
            ),
          ],
        ),
      ),
    );
  }
}
