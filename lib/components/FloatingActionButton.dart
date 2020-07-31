import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/classes/Todo.dart';
import 'package:todos/classes/TodoModel.dart';
import 'package:todos/services/TodoService.dart';

import '../themes.dart';

class MyFloatingActionButton extends StatefulWidget {
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  String todoText = "";
  TodoDB todoDB;
  @override
  void initState() {
    todoDB = TodoDB();
    todoDB.setDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todos, child) {
        return FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              backgroundColor: kActiveCardColor,
              context: context,
              isScrollControlled: true,
              builder: (context) => Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Theme(
                  data: ThemeData.dark(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          autofocus: true,
                          onChanged: (value) {
                            setState(() {
                              todoText = value;
                            });
                          },
                          cursorColor: kSecondaryColor,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "I want to...",
                            hintStyle: kActiveTextStyle,
                            filled: true,
                            fillColor: kInactiveCardColor,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              color: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              onPressed: () {
                                Todo todo =
                                    Todo(todoText: todoText, isCompleted: 0);
                                Navigator.pop(context);
                                todoDB.insertTodo(todo).then(
                                  (id) {
                                    todo.setID(id);
                                    todos.addTodo(todo);
                                  },
                                );
                                todoText = "";
                              },
                              child: Center(
                                child: Text("Add"),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Center(
                                child: Text("Cancel"),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: kSecondaryColor,
        );
      },
    );
  }
}
