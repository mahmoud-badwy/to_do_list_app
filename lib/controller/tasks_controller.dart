import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../constants/databases/notes_sql.dart';
import '../constants/databases/shared_sql.dart';
import '../view/widgets/home/my_alert_widget.dart';

class TasksController with ChangeNotifier {
  final player = AudioPlayer();
  MySqlDb mySqlDbTasks = MySqlDb();
  MySharedSqlDb mySqlDbShareds = MySharedSqlDb();
  List<Map> allTasks = [];
  List<Map> normalTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  TextEditingController inputController = TextEditingController();
  //is sound on
  bool isSoundOn = false;
  bool isFullSound = false;
  //is sound on
  bool isCompleteC = false;
  void onChangeisCompleteC(bool newValue) {
    isCompleteC = newValue;
    notifyListeners();
  }

  Future<void> playSound() async {
    if (isSoundOn) {
      await player.stop();
      if (isFullSound) {
        await player.play(AssetSource('sounds/full.mp3'));
      } else {
        await player.play(AssetSource('sounds/half.mp3'));
      }
    }
  }

  Future<void> getData() async {
    Future<List<Map>> response = mySqlDbTasks.readData('notes');
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

  void changeTaskStatue(
      bool isComplete, int index, int id, String screen) async {
    if (screen == 'normal') {
      if (normalTasks[index]['typeDone'] == 'done') {
        await mySqlDbTasks.updateData(
          'notes',
          {'typeDone': 'notDone', 'kind': 'normal'},
          id,
        );
      } else {
        playSound();
        await mySqlDbTasks.updateData(
          'notes',
          {'typeDone': 'done', 'kind': 'done'},
          id,
        );
      }
    } else if (screen == 'done') {
      if (doneTasks[index]['typeDone'] == 'done') {
        await mySqlDbTasks.updateData(
          'notes',
          {'typeDone': 'notDone', 'kind': 'normal'},
          id,
        );
      } else {
        playSound();
        await mySqlDbTasks.updateData(
          'notes',
          {'typeDone': 'done', 'kind': 'done'},
          id,
        );
      }
    }

    await getData();

    notifyListeners();
  }

  void addToArchive(int id) {
    mySqlDbTasks.updateData(
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
      mySqlDbTasks.updateData(
          'notes',
          {
            'kind': 'done',
          },
          id);
    } else {
      mySqlDbTasks.updateData(
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
    mySqlDbTasks.deleteData('notes', id);
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
      // ignore: unused_local_variable
      int response = await mySqlDbTasks.insertData(
        'notes',
        {
          'note': taskName ?? inputController.text,
          'typeDone': isCompleteC ? 'done' : 'notDone',
          'kind': isCompleteC ? 'done' : 'normal',
        },
      );
      getData();
    } else {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow[200],
          content: MyAlertWidget(
            icon: Icons.done_rounded,
            text: 'You Can\'t add empty task !',
            color: Colors.green[400]!,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }

    inputController.clear();
    isCompleteC = false;
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    for (var element in allTasks) {
      mySqlDbTasks.deleteData('notes', element['id']);
    }
    getData();
    notifyListeners();
  }

  doneAll() {
    if (normalTasks.isNotEmpty) {
      playSound();
      for (var element in normalTasks) {
        mySqlDbTasks.updateData(
          'notes',
          {'typeDone': 'done', 'kind': 'done'},
          element['id'],
        );
      }
      getData();
    }

    notifyListeners();
  }

  archiveAll() {
    for (var element in allTasks) {
      mySqlDbTasks.updateData(
        'notes',
        {
          'kind': 'archive',
        },
        element['id'],
      );
    }
    getData();
    notifyListeners();
  }

  // ===============check is sound on or not =======
  void setIsSoundOn(bool newValue) async {
    await player.stop();
    isSoundOn = newValue;
    var response = mySqlDbShareds.updateData(
      'shareds',
      {
        "name": "voice",
        "isOn": isSoundOn.toString(),
      },
      1,
    );
    notifyListeners();
  }

  void setIsFullSound(bool newValue) {
    isFullSound = newValue;
    var response = mySqlDbShareds.updateData(
      'shareds',
      {
        "name": "complete",
        "isOn": isFullSound.toString(),
      },
      2,
    );
    notifyListeners();
  }

  List alldataShareds = [];
  Future<void> getSharedData() async {
    Future<List<Map>> response = mySqlDbShareds.readData('shareds');

    alldataShareds = await response;
    if (alldataShareds[0]['isOn'] == 'true') {
      isSoundOn = true;
    } else {
      isSoundOn = false;
    }
    if (alldataShareds[1]['isOn'] == 'true') {
      isFullSound = true;
    } else {
      isFullSound = false;
    }
  }
}
