import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task_model.dart';

class TasksController with ChangeNotifier {
  List<TaskModel> allTasks = [];
  List<TaskModel> doneTasks = [];
  List<TaskModel> archiveTasks = [];
  TextEditingController inputController = TextEditingController();

  void changeTaskStatue(bool isComplete, int index, String list) {
    if (list == 'all') {
      allTasks[index].statueBool = isComplete;
      allTasks[index].statue = isComplete ? 'done' : 'normal';
      if (allTasks[index].statue != 'normal') {
        doneTasks.add(allTasks[index]);
      } else {
        doneTasks.remove(allTasks[index]);
      }
    } else if (list == 'done') {
      doneTasks[index].statueBool = isComplete;
      doneTasks[index].statue = isComplete ? 'done' : 'normal';
      if (doneTasks[index].statue == 'normal') {
        doneTasks.remove(doneTasks[index]);
      }
    } else if (list == 'archive') {
      archiveTasks[index].statueBool = isComplete;
      archiveTasks[index].statue = isComplete ? 'done' : 'normal';
    }

    notifyListeners();
  }

  void addTask({
    String? taskName,
    bool isComplete = false,
    required BuildContext context,
  }) {
    allTasks.add(
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
