import 'package:flutter/material.dart';
import 'package:todos/constants.dart';
import 'package:todos/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(
          0xFF0A0C22,
        ),
        secondaryHeaderColor: kBottomColor,
        scaffoldBackgroundColor: Color(0xff0A0C22),
      ),
      home: HomeScreen(),
    );
  }
}
