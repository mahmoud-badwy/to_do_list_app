import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task_model.dart';

class TasksController with ChangeNotifier {
  List<TaskModel> myTasks = [];
  TextEditingController inputController = TextEditingController();

  void changeTaskStatue(bool? isComplete, int index) {
    myTasks[index].statueBool = isComplete!;

    notifyListeners();
  }

  void addTask({
    String? taskName,
    bool isComplete = false,
    required BuildContext context,
  }) {
    myTasks.add(
      TaskModel(
        taskName: taskName ?? inputController.text,
        statue: isComplete ? 'done' : 'normal',
        id: 'fjghfjghjf',
        statueBool: isComplete,
      ),
    );
    inputController.clear();
    Navigator.pop(context);
    notifyListeners();
  }
}
