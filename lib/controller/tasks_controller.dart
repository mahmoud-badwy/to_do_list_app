import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/task_model.dart';

class TasksController with ChangeNotifier {
  List<TaskModel> allTasks = [];
  List<TaskModel> doneTasks = [];
  List<TaskModel> archiveTasks = [];
  TextEditingController inputController = TextEditingController();
  bool isCompleteC = false;
  void onChangeisCompleteC(bool newValue) {
    isCompleteC = newValue;
    notifyListeners();
  }

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

  void onCancel(context) {
    inputController.clear();
    isCompleteC = false;
    Navigator.pop(context);
  }

  void addTask({
    String? taskName,
    required BuildContext context,
  }) {
    allTasks.add(
      TaskModel(
        taskName: taskName ?? inputController.text,
        statue: isCompleteC ? 'done' : 'normal',
        id: 'fjghfjghjf',
        statueBool: isCompleteC,
      ),
    );
    if (isCompleteC) {
      doneTasks.add(
        TaskModel(
          taskName: taskName ?? inputController.text,
          statue: isCompleteC ? 'done' : 'normal',
          id: 'fjghfjghjf',
          statueBool: isCompleteC,
        ),
      );
    }
    inputController.clear();
    isCompleteC = false;
    Navigator.pop(context);
    notifyListeners();
  }
}
