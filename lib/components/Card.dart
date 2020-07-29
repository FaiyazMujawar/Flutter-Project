import 'package:flutter/material.dart';
import 'package:todos/themes.dart';

class TodoCard extends StatefulWidget {
  final todoText;
  final isCompleted;
  final action;

  const TodoCard({Key key, this.todoText, this.isCompleted, this.action})
      : super(key: key);
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  String todoText;
  bool isCompleted;
  Function action;
  BoxDecoration cardStyle;
  Color checkboxColor;
  Color checkColor;
  TextStyle textStyle;
  @override
  void initState() {
    todoText = widget.todoText;
    isCompleted = widget.isCompleted;
    action = widget.action;
    cardStyle = isCompleted ? kInactiveCardStyle : kActiveCardStyle;
    checkboxColor = isCompleted ? Color(0xff1D1F33) : Colors.transparent;
    checkColor = isCompleted ? Colors.grey : Colors.transparent;
    textStyle = isCompleted ? kActiveTextStyle : kInactiveTextStyle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;
    return Theme(
      data: ThemeData.dark(),
      child: Container(
        padding: EdgeInsets.fromLTRB(padding, padding, padding, padding),
        margin: EdgeInsets.only(top: 8.0),
        decoration: cardStyle,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                setState(() {
                  isCompleted = value;
                  cardStyle =
                      isCompleted ? kInactiveCardStyle : kActiveCardStyle;
                  checkboxColor =
                      isCompleted ? Color(0xff1D1F33) : Colors.transparent;
                  checkColor = isCompleted ? Colors.grey : Colors.transparent;
                  textStyle =
                      isCompleted ? kActiveTextStyle : kInactiveTextStyle;
                });
              },
              activeColor: checkboxColor,
              checkColor: checkColor,
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Container(
                child: Text(
                  todoText,
                  style: textStyle,
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            GestureDetector(
              onTap: action,
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
