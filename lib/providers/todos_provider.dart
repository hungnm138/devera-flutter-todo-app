import 'package:flutter/material.dart';
import 'package:to_do_app/data/repositories/todo_repository_impl.dart';

import '../data/repositories/todo_repository.dart';
import '../models/todo.dart';

class TodosProvider extends ChangeNotifier {
  late TodoRepository _todoRepository;

  List<Todo> _todos = <Todo>[];

  List<Todo> get todos => _todos;

  TodosProvider() {
    _todoRepository = TodoRepositoryImpl();
    init();
  }

  init() async{
    _todos = await _todoRepository.getAllTodos();
    notifyListeners();
  }

  void addTodo(Todo todo) async {
    await _todoRepository.addTodo(todo);
    await init();
    notifyListeners();
  }

  void update(Todo todo) async {
    await _todoRepository.updateTodo(todo);
    _todos = _todos.map((e) {
      if (e.id == todo.id) {
        return todo;
      } else {
        return e;
      }
    }).toList();
    notifyListeners();
  }

  void removeTodo(Todo todo) async {
    await _todoRepository.deleteTodo(todo);
    _todos.removeWhere((element) => element.id == todo.id);
    notifyListeners();
  }
  void removeAllTodos(String id) async {
    await _todoRepository.deleteAllTodos();
    _todos.clear();
    notifyListeners();
  }

}
