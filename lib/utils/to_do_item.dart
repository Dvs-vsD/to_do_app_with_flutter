import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget {
  final String todoName;
  final bool isChecked;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDeleteTask;

  const TodoItem({
    super.key,
    required this.todoName,
    required this.isChecked,
    required this.onChanged,
    required this.onDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(16)),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDeleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,borderRadius: BorderRadius.circular(16),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                todoName,
                style: TextStyle(fontSize: 18,
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
