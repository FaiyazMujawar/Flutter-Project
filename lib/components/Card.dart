import 'package:flutter/material.dart';
import 'package:todos/classes/Todo.dart';
import 'package:todos/services/TodoService.dart';
import 'package:todos/themes.dart';

class TodoCard extends StatefulWidget {
  final id;
  final todoText;
  final isCompleted;
  final action;

  const TodoCard(
      {Key key, this.todoText, this.isCompleted, this.action, this.id})
      : super(key: key);
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  int id;
  String todoText;
  bool isCompleted;
  Function action;
  BoxDecoration cardStyle;
  Color checkboxColor;
  Color checkColor;
  TextStyle textStyle;
  TodoDB todoDB;
  @override
  void initState() {
    todoDB = TodoDB();
    todoDB.setDatabase();
    id = widget.id;
    todoText = widget.todoText;
    isCompleted = widget.isCompleted;
    action = widget.action;
    cardStyle = isCompleted ? kInactiveCardStyle : kActiveCardStyle;
    checkboxColor = isCompleted ? Color(0xff1D1F33) : Colors.transparent;
    checkColor = isCompleted ? Colors.grey : Colors.transparent;
    textStyle = isCompleted ? kInactiveTextStyle : kActiveTextStyle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;
    return Theme(
      data: ThemeData.dark(),
      child: Dismissible(
        key: ObjectKey(todoText),
        onDismissed: (dir) => action(),
        dismissThresholds: {
          DismissDirection.endToStart: 0.6,
          DismissDirection.startToEnd: 1.0,
        },
        background: Container(
          color: Colors.transparent,
        ),
        secondaryBackground: Container(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(padding),
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
                        isCompleted ? kInactiveTextStyle : kActiveTextStyle;
                    todoDB.setCompletedStatus(
                      Todo(
                          id: id,
                          todoText: todoText,
                          isCompleted: isCompleted ? 1 : 0),
                    );
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
            ],
          ),
        ),
      ),
    );
  }
}
