import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todos_provider.dart';
import '../widgets/todos_form_screen.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Todos",
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontSize: 28,
              fontFamily: 'Cera'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                value: context.read<TodosProvider>(),
                child: const TodosFormScreen(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Consumer<TodosProvider>(
            builder: (context, provider, _) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: provider.todos.isEmpty
                    ? const Center(
                        child: Text('No todos added yet.'),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          context.read<TodosProvider>().init();
                        },
                        child: ListView.builder(
                            itemCount: provider.todos.length,
                            itemBuilder: (BuildContext context, int index) {
                              final todo = provider.todos[index];
                              return Card(
                                child: ListTile(
                                  title: Text(todo.title),
                                  subtitle: Text(todo.description),
                                ),
                              );
                            }),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
