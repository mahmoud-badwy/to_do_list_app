import 'package:flutter/material.dart';

class BottomNaviagtionBarItem extends StatelessWidget {
  const BottomNaviagtionBarItem({
    super.key,
    this.isSelected,
    required this.icon,
    required this.lebel,
  });
  final bool? isSelected;
  final IconData icon;
  final String lebel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow[400],
      ),
      padding: const EdgeInsets.all(10),
      // height: 60,
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
    );
  }
}
