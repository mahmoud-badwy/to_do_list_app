import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/view/widgets/tasks_widget.dart';

class ArchiveTasks extends StatelessWidget {
  const ArchiveTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, value, child) {
        if (value.myTasks.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20),
            itemCount: value.myTasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(index: index);
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
