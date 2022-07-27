import 'package:to_do_app/data/data_source/network/todo_firestore_service.dart';
import 'package:to_do_app/data/repositories/todo_repository.dart';
import 'package:to_do_app/models/todo.dart';
import '../data_source/local/todo_db_service.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDbService _todoDbService;
  final TodoFirestoreService _todoFirestoreService;

  TodoRepositoryImpl(
      {TodoDbService? todoDbService,
      TodoFirestoreService? todoFirestoreService})
      : _todoDbService = todoDbService ?? TodoDbService(),
        _todoFirestoreService = todoFirestoreService ?? TodoFirestoreService();

  @override
  Future<List<Todo>> getAllTodos() {
    return _todoFirestoreService
        .getTodos()
        .catchError((error) => _todoDbService.getTodos())
        .then((value) => value);
  }

  @override
  Future<void> addTodo(Todo todo) {
    // TODO: implement deleteTodo
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
  Future<void> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
