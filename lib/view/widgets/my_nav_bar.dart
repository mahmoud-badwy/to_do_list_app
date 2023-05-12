import 'package:flutter/material.dart';
import 'package:to_do_list_app/view/widgets/bottom_nav_item.dart';

class MyBottomNavigatoinBar extends StatelessWidget {
  const MyBottomNavigatoinBar({
    super.key,
  });

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
        children: const [
          BottomNaviagtionBarItem(
            isSelected: true,
            icon: Icons.task,
            lebel: 'Tasks',
          ),
          SizedBox(
            width: 30,
          ),
          BottomNaviagtionBarItem(
            isSelected: true,
            icon: Icons.done_all,
            lebel: 'Done',
          ),
          SizedBox(
            width: 30,
          ),
          BottomNaviagtionBarItem(
            isSelected: true,
            icon: Icons.archive,
            lebel: 'Arcive',
          ),
        ],
      ),
    );
  }
}
