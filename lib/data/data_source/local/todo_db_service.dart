import 'package:hive/hive.dart';

import '../../../models/todo.dart';
import '../todo_data_service.dart';

class TodoDbService implements TodoDataService {
  late Box box;

  TodoDBProvider() {
    _initHive();
  }

  _initHive() async {
    box = Hive.box<Todo>('todos');
  }

  @override
  Future<List<Todo>> getTodos() => Future.value(List<Todo>.from(box.values));

  @override
  Future<void> addTodo(Todo todo) async {
    await box.put(todo.id, todo);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await box.delete(todo.id);
  }

  @override
  Future<void> deleteAllTodos() async {
    await box.clear();
  }

  @override
  Future<void> updateTodo(Todo todo) async {
  }
}
