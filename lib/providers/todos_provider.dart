import 'package:flutter/material.dart';

import '../data/repositories/todo_repository.dart';
import '../models/todo.dart';

class TodosProvider extends ChangeNotifier {
  late TodoRepository _todoRepository;

  List<Todo> _todos = <Todo>[];

  TodosProvider() {
    _todoRepository = TodoRepository();
    init();
  }

  List<Todo> get todos => _todos;

  init() {
    _todos = _todoRepository.getAllTodos();
    notifyListeners();
  }

  void addTodo(Todo todo) async {
    await _todoRepository.addTodo(todo);
    await init();
    notifyListeners();
  }

  void updateTodo(Todo todo, String id) {}
}
