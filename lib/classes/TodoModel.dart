import 'package:flutter/material.dart';
import 'package:todos/classes/Todo.dart';

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = [];

  TodoModel();

  int get length => _todos.length;

  Todo at(int index) => _todos[index];

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
  }
}
