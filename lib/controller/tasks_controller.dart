import 'package:flutter/material.dart';

class TasksController with ChangeNotifier {
  List myTasks = [
    ['take a shower', true],
    ['do homework', false],
    ['take a shower', true],
    ['do homework', false],
    ['take a shower', true],
    ['do homework', false],
    ['take a shower', true],
    ['do homework', false],
    ['take a shower', true],
    ['do homework', false],
    ['take a shower', true],
    ['do homework', false],
    ['take a shower', true],
    ['do homework', false],
    ['take a shower', true],
    ['do homework', false],
    ['take a shower', true],
    ['do homework', false],
  ];
 void  changeTaskStatue(bool? isComplete, int index) {
    myTasks[index][1] = !myTasks[index][1];

    notifyListeners();
  }

}
