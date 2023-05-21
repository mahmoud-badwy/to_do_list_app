import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants/sql_db.dart';

class TasksController with ChangeNotifier {
  MySqlDb mySqlDb = MySqlDb();
  List<Map> allTasks = [];
  List<Map> normalTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  TextEditingController inputController = TextEditingController();
  bool isCompleteC = false;
  void onChangeisCompleteC(bool newValue) {
    isCompleteC = newValue;
    notifyListeners();
  }

  Future<void> getData() async {
    Future<List<Map>> response = mySqlDb.readData('notes');
    allTasks = await response;
    normalTasks.clear();
    doneTasks.clear();
    archiveTasks.clear();
    for (var element in allTasks) {
      if (element['kind'].contains('done') ||
          element['kind'].contains('normal')) {
        normalTasks.add(element);

        if (element['kind'].contains('done')) {
          doneTasks.add(element);
        }
      } else if (element['kind'].contains('archive')) {
        archiveTasks.add(element);
      }
    }
    notifyListeners();
  }

  void changeTaskStatue(bool isComplete, int index, int id) async {
    if (allTasks[index]['typeDone'] == 'done') {
      await mySqlDb.updateData(
        'notes',
        {'typeDone': 'notDone', 'kind': 'normal'},
        id,
      );
    } else {
      await mySqlDb.updateData(
        'notes',
        {'typeDone': 'done', 'kind': 'done'},
        id,
      );
    }
    await getData();

    notifyListeners();
  }

  void addToArchive(int id) {
    mySqlDb.updateData(
        'notes',
        {
          'kind': 'archive',
        },
        id);
    getData();
    notifyListeners();
  }

  void removeFromArchive(int id, {required String typeDone}) {
    if (typeDone == 'done') {
      mySqlDb.updateData(
          'notes',
          {
            'kind': 'done',
          },
          id);
    } else {
      mySqlDb.updateData(
          'notes',
          {
            'kind': 'normal',
          },
          id);
    }

    getData();
    notifyListeners();
  }

  void delete(int id) {
    mySqlDb.deleteData('notes', id);
    getData();
    notifyListeners();
  }

  void onCancel(context) {
    inputController.clear();
    isCompleteC = false;
    Navigator.pop(context);
  }

  void addTask({String? taskName, required BuildContext context}) async {
    if (inputController.text.isNotEmpty) {
      int response = await mySqlDb.insertData(
        'notes',
        {
          'note': taskName ?? inputController.text,
          'typeDone': isCompleteC ? 'done' : 'notDone',
          'kind': isCompleteC ? 'done' : 'normal',
        },
      );
      getData();
    } else {
      print('empty');
    }

    inputController.clear();
    isCompleteC = false;
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    notifyListeners();
  }
}
