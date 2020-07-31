import 'package:flutter/material.dart';

const kInactiveCardColor = Color(0xff161729);
const kActiveCardColor = Color(0xff1D1F33);
const kSecondaryColor = Color(0xffE84C56);

const kTextColor = Color(0xff7F828E);

var kActiveCardStyle = BoxDecoration(
  color: Colors.white.withOpacity(0.125),
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

const kInactiveCardStyle = BoxDecoration(
  color: kInactiveCardColor,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

const kActiveTextStyle = TextStyle(
  color: kTextColor,
);

const kInactiveTextStyle = TextStyle(
  decoration: TextDecoration.lineThrough,
  decorationThickness: 2.5,
  color: Color(0xff33354b),
);

const kInterpretationStyle = TextStyle(fontSize: 20);
