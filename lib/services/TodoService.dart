import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todos/classes/Todo.dart';

class TodoDB {
  Future<Database> _database;

  TodoDB();

  Future<int> insertTodo(Todo todo) async {
    final Database db = await _database;
    return await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> getTodos() async {
    final Database db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        todoText: maps[i]['todoText'],
        isCompleted: maps[i]['isCompleted'],
      );
    });
  }

  Future<void> setDatabase() async {
    _database = openDatabase(
      join(await getDatabasesPath(), "todos.db"),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, todoText TEXT, isCompleted INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> setCompletedStatus(Todo todo) async {
    final db = await _database;
    await db.update(
      'todos',
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(int id) async {
    final db = await _database;
    await db.delete(
      'todos',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
