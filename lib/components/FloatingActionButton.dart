import 'package:flutter/material.dart';

import '../themes.dart';

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15.0))),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(15, 0, 15, 0)),
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
                                  print("pressed");
                                },
                                child: Center(
                                  child: Text("Add"),
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              FlatButton(
                                onPressed: null,
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
                ));
      },
      child: Icon(Icons.add),
      backgroundColor: kSecondaryColor,
    );
  }
}
