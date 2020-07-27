import 'package:flutter/material.dart';
import 'package:todos/constants.dart';

class Card extends StatefulWidget {
  final todoText;
  final isCompleted;

  const Card({Key key, this.todoText, this.isCompleted}) : super(key: key);
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  String todoText;
  bool isCompleted;
  @override
  void initState() {
    todoText = widget.todoText;
    isCompleted = widget.isCompleted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: false,
            onChanged: (value) {
              setState(() {});
            },
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            todoText,
            style: kTextStyle,
          )
        ],
      ),
    );
  }
}
