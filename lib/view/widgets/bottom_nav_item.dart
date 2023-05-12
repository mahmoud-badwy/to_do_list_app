import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/toggle_tabs.dart';

class BottomNaviagtionBarItem extends StatelessWidget {
  const BottomNaviagtionBarItem({
    super.key,
    this.isSelected,
    required this.icon,
    required this.lebel,
    required this.id,
  });
  final bool? isSelected;
  final IconData icon;
  final String lebel;
  final int id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<ToggleTabsController>().changeCurruntTab(id),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.yellow[400],
        ),
        padding: const EdgeInsets.all(10),
        // height: 60,
        duration: const Duration(milliseconds: 10000),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 27,
            ),
            Visibility(
              visible: isSelected!,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    lebel,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
