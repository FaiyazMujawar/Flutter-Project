import 'package:flutter/material.dart';
import 'package:todos/components/Card.dart';
import 'package:todos/classes/Todo.dart';
import 'package:todos/components/FloatingActionButton.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todos = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
          child: Container(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                Todo todo = todos[index];
                return TodoCard(
                  key: ObjectKey(todo),
                  todoText: todo.getTodoText(),
                  isCompleted: todo.getIsCompleted(),
                  action: () {
                    print(index);
                    setState(() {
                      todos.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}
