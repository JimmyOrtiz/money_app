import 'package:flutter/material.dart';
import 'package:money_app/constants.dart';

class CreateTextFormField extends StatelessWidget {
  CreateTextFormField(
      {required this.hintText,
      required this.keyboardType,
      required this.onChanged});

  final String hintText;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 49),
      child: TextFormField(
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: kFormInputDecoration.copyWith(
          hintText: null,
        ),
      ),
    );
  }
}
