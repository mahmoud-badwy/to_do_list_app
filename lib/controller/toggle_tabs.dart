import 'package:flutter/material.dart';
import 'package:to_do_list_app/view/screens/tabs/all_tasks.dart';
import 'package:to_do_list_app/view/screens/tabs/archive.dart';
import 'package:to_do_list_app/view/screens/tabs/done.dart';

class ToggleTabsController with ChangeNotifier {
  int curruntTab = 0;
  List mytabs = [
    [const AllTasks(), true],
    [const DoneTasks(), false],
    [const ArchiveTasks(), false],
  ];
  void changeCurruntTab(int newCurruntTab) {
    curruntTab = newCurruntTab;
    if (newCurruntTab == 0) {
      mytabs[0][1] =  true;
      mytabs[1][1] =  false;
      mytabs[2][1] =  false;
    } else if (newCurruntTab == 1) {
      mytabs[1][1] =  true;
      mytabs[0][1] =  false;
      mytabs[2][1] =  false;
    } else if (newCurruntTab == 2) {
      mytabs[2][1] =  true;
      mytabs[1][1] =  false;
      mytabs[0][1] =  false;
    }
    notifyListeners();
  }
}
