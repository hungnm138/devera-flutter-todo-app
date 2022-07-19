import 'package:hive/hive.dart';

import '../../models/todo.dart';

class TodoDBService {
  late Box box;

  TodoDBService() {
    _initHive();
  }

  _initHive() async {
    box = Hive.box<Todo>('todos');
  }

  List<Todo> getAllTodos() => List<Todo>.from(box.values);

  Future<void> addTodo(Todo todo) async {
    await box.put(todo.id, todo);
  }

  Future<void> deleteTodo(String id) async {
    await box.delete(id);
  }

  Future<void> deleteAllTodo() async {
    await box.clear();
  }
}
