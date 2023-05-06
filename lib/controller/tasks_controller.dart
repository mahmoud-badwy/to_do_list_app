import 'package:flutter/material.dart';

class TasksController with ChangeNotifier {
  List myTasks = [];
  TextEditingController inputController = TextEditingController();

  void changeTaskStatue(bool? isComplete, int index) {
    myTasks[index][1] = isComplete;

    notifyListeners();
  }

  void addTask(
      {String? taskName, bool? isComplete, required BuildContext context}) {
    myTasks.add([taskName ?? inputController.text, isComplete ?? false]);
    inputController.clear();
    Navigator.pop(context);
    notifyListeners();
  }
}
