import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/tasks_controller.dart';
import '../../../helper/mediaquery.dart';
import '../../widgets/home/tasks_widget.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, value, child) {
        if (value.doneTasks.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: context.getWidth() / 20),
            itemCount: value.doneTasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                index: index,
                tasks: value.doneTasks,
                screen: 'done',
              );
            },
          );
        }
        return const Center(
          child: Text(
            'you have no any done tasks',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        );
      },
    );
  }
}
