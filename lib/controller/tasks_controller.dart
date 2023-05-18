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
        allTasks.remove(allTasks[index]);
      } else {
        doneTasks.remove(allTasks[index]);
      }
    } else if (list == 'done') {
      doneTasks[index].statueBool = isComplete;
      doneTasks[index].statue = isComplete ? 'done' : 'normal';
      if (doneTasks[index].statue == 'normal') {
        allTasks.add(doneTasks[index]);
        doneTasks.remove(doneTasks[index]);
      }
    } else if (list == 'archive') {
      archiveTasks[index].statueBool = isComplete;
      archiveTasks[index].statue = isComplete ? 'done' : 'normal';
      if (archiveTasks[index].statue == 'normal') {
        allTasks.add(archiveTasks[index]);
        archiveTasks.remove(archiveTasks[index]);
      } else if (archiveTasks[index].statue == 'done') {
        doneTasks.add(archiveTasks[index]);
        archiveTasks.remove(archiveTasks[index]);
      }
    }

    notifyListeners();
  }

  void addToArchive(int index, String list) {
    if (list == 'all') {
      allTasks[index].statue = 'archive';
      archiveTasks.add(allTasks[index]);
      allTasks.remove(allTasks[index]);
    } else if (list == 'done') {
      doneTasks[index].statue = 'archive';
      archiveTasks.add(doneTasks[index]);
      doneTasks.remove(doneTasks[index]);
    }
    notifyListeners();
  }

  void delete(int index, String list) {
    if (list == 'all') {
      allTasks.remove(allTasks[index]);
    } else if (list == 'done') {
      doneTasks.remove(doneTasks[index]);
    } else if (list == 'archive') {
      archiveTasks.remove(archiveTasks[index]);
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
    if (isCompleteC) {
      if (inputController.text.isNotEmpty) {
        doneTasks.add(
          TaskModel(
            taskName: taskName ?? inputController.text,
            statue: isCompleteC ? 'done' : 'normal',
            id: 'fjghfjghjf',
            statueBool: isCompleteC,
          ),
        );
      } else {
        print('empty');
      }
    } else {
      if (inputController.text.isNotEmpty) {
        allTasks.add(
          TaskModel(
            taskName: taskName ?? inputController.text,
            statue: isCompleteC ? 'done' : 'normal',
            id: 'fjghfjghjf',
            statueBool: isCompleteC,
          ),
        );
      } else {
        print('empty');
      }
    }
    inputController.clear();
    isCompleteC = false;
    Navigator.pop(context);
    notifyListeners();
  }
}
