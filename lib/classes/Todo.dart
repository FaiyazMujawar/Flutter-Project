class Todo {
  String todoText;
  bool isCompleted;

  Todo({this.todoText, this.isCompleted});

  String getTodoText() {
    return this.todoText;
  }

  bool getIsCompleted() {
    return this.isCompleted;
  }
}
