import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/classes/TodoModel.dart';

import '../themes.dart';

class MyFloatingActionButton extends StatefulWidget {
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  String todoText = "";
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
                          decoration: InputDecoration(
                            hintText: "I want to...",
                            hintStyle: kInactiveTextStyle,
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
                                Navigator.pop(context);
                                todos.addTodo(todoText);
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
