import '../../models/todo.dart';
import '../db/todo_db_service.dart';

class TodoRepository {
  final TodoDBService _todoDBService;

  TodoRepository({TodoDBService? todoDBService})
      : _todoDBService = todoDBService ?? TodoDBService();

  List<Todo> getAllTodos() => _todoDBService.getAllTodos();

  Future<void> addTodo(Todo todo) async {
    await _todoDBService.addTodo(todo);
  }

  Future<void> deleteTodo(String id) async {
    await _todoDBService.deleteTodo(id);
  }

  Future<void> updateTodo(Todo todo) async {
    await _todoDBService.addTodo(todo);
  }

  Future<void> deleteAllTodos() async {
    await _todoDBService.deleteAllTodo();
  }
}
