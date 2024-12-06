import 'package:flutter/material.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/utils/add_todo_dialog.dart';
import 'package:to_do/utils/to_do_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoDatabase db = TodoDatabase();

  final _controller = TextEditingController();
  bool validate = false;

  @override
  void initState() {
    super.initState();
    db.loadData();
  }

  void itemChecked(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //Add to-do item
  void saveNewTask() {
    setState(
      () {
        String taskName = _controller.text;
        db.toDoList.add([taskName, false]);
      },
    );
    _controller.clear();
    db.updateData();
    Navigator.of(context).pop();
  }

  //Delete to-do item
  void onDeleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  void addTodo() {
    validate = false;
    showDialog(
      context: context,
      builder: (context) {
        return AddTodoDialog(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'TO DO',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      body: db.toDoList.isNotEmpty
          ? ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  todoName: db.toDoList[index][0],
                  isChecked: db.toDoList[index][1],
                  onChanged: (value) => itemChecked(index),
                  onDeleteTask: (value) => onDeleteTask(index),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/placeholder_img.png', width: 200, height: 200,),
                  Text('You are all done !!! Add New Tasks', style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
