import 'package:hive/hive.dart';

import '../../../models/todo.dart';
import '../todo_data_service.dart';

class TodoFirestoreService implements TodoDataService {
  @override
  Future<void> addTodo(Todo todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllTodos() {
    // TODO: implement deleteAllTodos
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}
