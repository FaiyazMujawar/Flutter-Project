class Todo {
  int id;
  final String todoText;
  int isCompleted;

  Todo({this.id, this.todoText, this.isCompleted});

  void setID(int id) {
    this.id = id;
  }

  void setIsCompleted(int isCompleted) {
    this.isCompleted = isCompleted;
  }

  int getTodoId() {
    return this.id;
  }

  String getTodoText() {
    return this.todoText;
  }

  int getIsCompleted() {
    return this.isCompleted;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'isCompleted': isCompleted,
    };
  }
}
