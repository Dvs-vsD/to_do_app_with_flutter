import 'package:flutter/material.dart';
import 'package:to_do/utils/custom_button.dart';

class AddTodoDialog extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const AddTodoDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  bool validate = false;

  void handleSave() {
    setState(() {
      validate = widget.controller.text.isEmpty;
    });

    if (!validate) {
      widget.onSave();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[400],
      title: const Text('Add Task'),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'add a new to-do',
                  errorText: validate ? 'Task can not be empty !!!' : null),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  onPressed: handleSave,
                  text: 'Save',
                  btnColor: Colors.black,
                ),
                const SizedBox(
                  width: 16,
                ),
                CustomButton(
                  onPressed: widget.onCancel,
                  text: 'Cancel',
                  btnColor: Colors.grey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
