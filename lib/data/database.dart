import 'package:hive_flutter/adapters.dart';

class TodoDatabase {
  List toDoList = [];
  //reference the box
  final _myBox = Hive.box('myBox');

  //load the data from the database
  void loadData() {
    toDoList = _myBox.get('TODOLIST') ?? [];
  }

  //Update the database
  void updateData() {
    _myBox.put('TODOLIST', toDoList);
  }
}