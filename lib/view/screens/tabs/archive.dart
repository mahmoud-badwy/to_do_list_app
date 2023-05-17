import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';
import 'package:to_do_list_app/view/widgets/tasks_widget.dart';

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
              if (context.watch<TasksController>().archiveTasks[index].statue ==
                  'archive') {
                return TaskWidget(
                  index: index,
                  tasks: value.archiveTasks,
                  list: 'archive',
                );
              }
              return null;
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
