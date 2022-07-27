import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo _todo;
  final Function(Todo) onTap;
  final Function(Todo) onDelete;
  final Function(Todo) onEdit;

  const TodoCard(
      {Key? key,
      required Todo todo,
      required this.onTap,
      required this.onDelete,
      required this.onEdit})
      : _todo = todo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    const notCompletedIconColor = Color(0xFF4ED9D6);
    final completedIconColor = notCompletedIconColor.withAlpha(100);
    return Card(
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {
              onDelete(_todo);
            },
            closeOnCancel: true,
            confirmDismiss: () async {
              return await _showConfirmationDialog(context, "delete") ?? false;
            },
          ),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: (context) async {
                if (await _showConfirmationDialog(context, "delete") == true) {
                  onDelete(_todo);
                }
              },
              backgroundColor: const Color(0xFFFE4A69),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
            ),
            SlidableAction(
              flex: 1,
              onPressed: (context) async {},
              backgroundColor: const Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: "Archive",
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListTile(
            title: Text(
              _todo.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                decoration: _todo.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: _todo.completed ? Colors.grey : Colors.black,
              ),
            ),
            subtitle: Text(
              _todo.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                decoration: _todo.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: _todo.completed ? Colors.grey : Colors.black,
              ),
            ),
            leading: IconButton(
              icon: _todo.completed
                  ? Icon(
                      Icons.check_circle,
                      color: completedIconColor,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      color: notCompletedIconColor,
                    ),
              onPressed: () {
                onTap(_todo);
              },
            ),
            onTap: () {
              onEdit(_todo);
            },
          ),
        ),
      ),
    );
  }

  _showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to $action this item?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'))
          ],
        );
      },
    );
  }
}
