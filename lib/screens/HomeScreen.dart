import 'package:flutter/material.dart';
import 'package:todos/Card.dart';
import 'package:todos/themes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
          child: Container(
            child: Column(
              children: <Widget>[
                TodoCard(
                  todoText: "Design App",
                  isCompleted: false,
                ),
                TodoCard(
                  todoText: "Design App",
                  isCompleted: false,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        backgroundColor: kSecondaryColor,
      ),
    );
  }
}
