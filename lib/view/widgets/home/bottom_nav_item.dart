import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../constants/sizes.dart';
import '../../../controller/toggle_tabs.dart';

class MyBottomNaviagtionBarItem extends StatelessWidget {
  const MyBottomNaviagtionBarItem({
    super.key,
    this.isSelected,
    required this.icon,
    required this.lebel,
    required this.id,
    this.isSelected2,
  });
  final bool? isSelected;
  final bool? isSelected2;
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
        duration: const Duration(milliseconds: 200),
        width: isSelected! ? 110.sp : 50.sp,
        child: Row(
          // mainAxisAlignment:
          //     isSelected! ? MainAxisAlignment.start : MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: MySizes.iconSize,
            ),
            Visibility(
              visible: isSelected2!,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    lebel,
                    style: TextStyle(
                      fontSize: 18.sp,
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
