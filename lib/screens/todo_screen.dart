import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/todos_provider.dart';
import 'package:to_do_app/screens/todo_view.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodosProvider>(
      create: (_) => TodosProvider(),
      child: const TodoView(),
    );
  }
}
