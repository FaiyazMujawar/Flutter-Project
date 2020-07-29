import 'package:flutter/material.dart';
import 'package:todos/classes/Todo.dart';

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      todoText: "App design",
      isCompleted: true,
    ),
    Todo(
      todoText: "App development",
      isCompleted: false,
    ),
    Todo(
      todoText: "Documentation",
      isCompleted: false,
    ),
  ];

  int get length => _todos.length;

  Todo at(int index) => _todos[index];

  void addTodo(String todoText) {
    _todos.add(Todo(
      todoText: todoText,
      isCompleted: false,
    ));
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
  }
}
