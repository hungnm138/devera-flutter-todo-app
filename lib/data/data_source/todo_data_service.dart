import '../../models/todo.dart';

abstract class TodoDataService{
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteAllTodos();
}