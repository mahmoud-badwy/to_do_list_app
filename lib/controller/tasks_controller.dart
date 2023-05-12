import 'package:flutter/material.dart';

class TasksController with ChangeNotifier {
  List myTasks = [];
  TextEditingController inputController = TextEditingController();

  void changeTaskStatue(bool? isComplete, int index) {
    myTasks[index]['statue'] = isComplete;

    notifyListeners();
  }

  void addTask(
      {String? taskName, bool? isComplete, required BuildContext context}) {
    myTasks.add(
      {
        'name': taskName ?? inputController.text,
        'id': 2,
        'statue': isComplete ?? false,
      },
    );
    inputController.clear();
    Navigator.pop(context);
    notifyListeners();
  }
}
