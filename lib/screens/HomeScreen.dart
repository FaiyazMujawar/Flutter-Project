import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/classes/TodoModel.dart';
import 'package:todos/components/Card.dart';
import 'package:todos/classes/Todo.dart';
import 'package:todos/components/FloatingActionButton.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todos, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
              child: Container(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    Todo todo = todos.at(index);
                    return TodoCard(
                      key: ObjectKey(todo),
                      todoText: todo.getTodoText(),
                      isCompleted: todo.getIsCompleted(),
                      action: () {
                        print(index);
                        setState(() {
                          todos.removeTodo(index);
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
      },
    );
  }
}
