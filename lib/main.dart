import 'package:flutter/material.dart';
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
      theme: ThemeData(
        accentColor: Color.fromARGB(0, 255, 255, 255),
        scaffoldBackgroundColor: Color(0xff0A0C22),
      ),
      home: HomeScreen(),
    );
  }
}
