import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  bool completed;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.completed});

  @override
  String toString() => '$id: $title: $description: $completed';
}
