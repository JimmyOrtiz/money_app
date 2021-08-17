import 'package:flutter/material.dart';

const kGeneralColor = Colors.white;
const kMainColor = Color(0xffdb08aa);

const TextStyle kMoneyAppTitleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 20,
);

const TextStyle kWhiteTitleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 25,
);

const TextStyle kReusableButtonText = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);

const TextStyle kBlackSubtitleStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

const kFormInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kGeneralColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kGeneralColor),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: kGeneralColor),
  ),
);

const kActivityCardTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);
