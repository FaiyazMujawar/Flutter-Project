import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/classes/TodoModel.dart';
// import 'package:todos/classes/TodoModel.dart';
import 'package:todos/screens/HomeScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: MyApp(),
    ),
  );
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
