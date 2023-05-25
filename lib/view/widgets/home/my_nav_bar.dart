import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/toggle_tabs.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';
import 'package:to_do_list_app/view/widgets/home/bottom_nav_item.dart';

class MyBottomNavigatoinBar extends StatelessWidget {
  const MyBottomNavigatoinBar({
    super.key,
    required this.curruntTab,
  });
  final int curruntTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight() / 12,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.yellow[600],
      ),
      padding: EdgeInsets.symmetric(vertical: context.getHeight() / 90),
      // margin: EdgeInsets.only(
      //   bottom: context.getHeight() / 40,
      //   right: context.getWidth() / 15,
      //   left: context.getWidth() / 15,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyBottomNaviagtionBarItem(
            isSelected: context.watch<ToggleTabsController>().mytabs[0][1],
            isSelected2: context.watch<ToggleTabsController>().mytabs[0][2],
            icon: Icons.task,
            lebel: 'Tasks',
            id: 0,
          ),
          MyBottomNaviagtionBarItem(
            isSelected: context.watch<ToggleTabsController>().mytabs[1][1],
            isSelected2: context.watch<ToggleTabsController>().mytabs[1][2],
            icon: Icons.done_all,
            lebel: 'Done',
            id: 1,
          ),
          MyBottomNaviagtionBarItem(
            isSelected: context.watch<ToggleTabsController>().mytabs[2][1],
            isSelected2: context.watch<ToggleTabsController>().mytabs[2][2],
            icon: Icons.archive,
            lebel: 'Archive',
            id: 2,
          ),
        ],
      ),
    );
  }
}
