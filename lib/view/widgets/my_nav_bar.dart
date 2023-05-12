import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/toggle_tabs.dart';
import 'package:to_do_list_app/view/widgets/bottom_nav_item.dart';

class MyBottomNavigatoinBar extends StatelessWidget {
  const MyBottomNavigatoinBar({
    super.key,
    required this.curruntTab,
  });
  final int curruntTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow[600],
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20, right: 40, left: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomNaviagtionBarItem(
            isSelected: context.watch<ToggleTabsController>().mytabs[0][1],
            icon: Icons.task,
            lebel: 'Tasks',
            id: 0,
          ),
          const SizedBox(
            width: 30,
          ),
          BottomNaviagtionBarItem(
            isSelected: context.watch<ToggleTabsController>().mytabs[1][1],
            icon: Icons.done_all,
            lebel: 'Done',
            id: 1,
          ),
          const SizedBox(
            width: 30,
          ),
          BottomNaviagtionBarItem(
            isSelected: context.watch<ToggleTabsController>().mytabs[2][1],
            icon: Icons.archive,
            lebel: 'Arcive',
            id: 2,
          ),
        ],
      ),
    );
  }
}
