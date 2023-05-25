import 'package:flutter/material.dart';
import 'package:to_do_list_app/view/screens/tabs/all_tasks.dart';
import 'package:to_do_list_app/view/screens/tabs/archive.dart';
import 'package:to_do_list_app/view/screens/tabs/done.dart';

class ToggleTabsController with ChangeNotifier {
  PageController pageViewController = PageController();
  int curruntTab = 0;
  List mytabs = [
    [const AllTasksTab(), true, true],
    [const DoneTasks(), false, false],
    [const ArchiveTasks(), false, false],
  ];
  void changeCurruntTab(int newCurruntTab) {
    curruntTab = newCurruntTab;
    pageViewController.animateToPage(newCurruntTab,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    if (newCurruntTab == 0) {
      mytabs[0][1] = true;
      mytabs[1][1] = false;
      mytabs[2][1] = false;
      mytabs[1][2] = false;
      mytabs[2][2] = false;
      Future.delayed(const Duration(milliseconds: 200), () {
        mytabs[0][2] = true;
        notifyListeners();
      });
    } else if (newCurruntTab == 1) {
      mytabs[1][1] = true;
      mytabs[0][1] = false;
      mytabs[2][1] = false;
      mytabs[0][2] = false;
      mytabs[2][2] = false;
      Future.delayed(const Duration(milliseconds: 200), () {
        mytabs[1][2] = true;
        notifyListeners();
      });
    } else if (newCurruntTab == 2) {
      mytabs[2][1] = true;
      mytabs[1][1] = false;
      mytabs[0][1] = false;
      mytabs[1][2] = false;
      mytabs[0][2] = false;

      Future.delayed(const Duration(milliseconds: 280), () {
        mytabs[2][2] = true;
        notifyListeners();
      });
    }
    notifyListeners();
  }
}
