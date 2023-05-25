import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/tasks_controller.dart';
import '../../../helper/mediaquery.dart';
import '../../widgets/home/tasks_widget.dart';

class ArchiveTasks extends StatelessWidget {
  const ArchiveTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, value, child) {
        if (value.archiveTasks.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: context.getWidth() / 20),
            itemCount: value.archiveTasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                index: index,
                tasks: value.archiveTasks,
                screen: 'archive',
              );
            },
          );
        }
        return const Center(
          child: Text(
            'you have no any tasks in Archive !',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        );
      },
    );
  }
}
