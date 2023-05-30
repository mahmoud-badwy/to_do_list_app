import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/tasks_controller.dart';
import '../../../helper/mediaquery.dart';
import '../../widgets/home/tasks_widget.dart';

class AllTasksTab extends StatelessWidget {
  const AllTasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, value, child) {
        if (value.normalTasks.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: context.getWidth() / 20),
            itemCount: value.normalTasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                index: index,
                tasks: value.normalTasks,
                screen: 'normal',
              );
            },
          );
        }
        return Center(
          child: Text(
            'you have no tasks',
            style: TextStyle(
              fontSize: 30.sp,
            ),
          ),
        );
      },
    );
  }
}
