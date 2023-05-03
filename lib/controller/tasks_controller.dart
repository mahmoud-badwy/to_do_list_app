import 'package:flutter/material.dart';

class TasksController with ChangeNotifier {
  List myTasks = [];

  void changeTaskStatue(bool? isComplete, int index) {
    myTasks[index][1] = !myTasks[index][1];

    notifyListeners();
  }

  void addTask(String taskName, bool? isComplete) {
    myTasks.add([taskName, isComplete ?? false]);
    print(myTasks.last);
    notifyListeners();
  }
}
