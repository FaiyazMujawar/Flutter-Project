import 'package:flutter/material.dart';

class Todo {
  Key key;
  String todoText;
  bool isCompleted;

  Todo({this.key, this.todoText, this.isCompleted});

  String getTodoText() {
    return this.todoText;
  }

  bool getIsCompleted() {
    return this.isCompleted;
  }
}
