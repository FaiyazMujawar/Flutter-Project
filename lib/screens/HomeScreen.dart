import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/classes/TodoModel.dart';
import 'package:todos/components/Card.dart';
import 'package:todos/classes/Todo.dart';
import 'package:todos/components/FloatingActionButton.dart';
import 'package:todos/services/TodoService.dart';

import '../themes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _home = Center(
    child: CircularProgressIndicator(
      backgroundColor: kSecondaryColor,
    ),
  );
  TodoDB todoDB = TodoDB();
  bool isStart;
  @override
  void initState() {
    isStart = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todos, child) {
        if (isStart) {
          _setTodos(todos);
          return _home;
        }
        return _getListWidget(todos);
      },
    );
  }

  Widget _getListWidget(TodoModel todos) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
          child: Container(
            child: todos.length == 0
                ? Center(
                    child: Text(
                      "All caught up!",
                      style: kActiveTextStyle,
                    ),
                  )
                : ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      Todo todo = todos.at(index);
                      return TodoCard(
                        key: ObjectKey(todo),
                        id: todo.getTodoId(),
                        todoText: todo.getTodoText(),
                        isCompleted: todo.getIsCompleted() == 1,
                        action: () {
                          todoDB.deleteTodo(todo.getTodoId());
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
  }

  Future<void> _setTodos(TodoModel todos) async {
    await todoDB.setDatabase();
    List<Todo> todoList = await todoDB.getTodos();
    for (var todo in todoList) {
      todos.addTodo(todo);
    }
    isStart = false;
    setState(() {
      _home = _getListWidget(todos);
    });
  }
}
