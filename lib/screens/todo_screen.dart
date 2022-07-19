import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todos_provider.dart';
import 'todo_view.dart';

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
