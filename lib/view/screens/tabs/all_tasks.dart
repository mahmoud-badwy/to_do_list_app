import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';
import 'package:to_do_list_app/view/widgets/tasks_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, value, child) {
        if (value.allTasks.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: context.getWidth() / 20),
            itemCount: value.allTasks.length,
            itemBuilder: (context, index) {
             
              return TaskWidget(index: index, tasks: value.allTasks,);
            },
          );
        }
        return const Center(
          child: Text(
            'you have no tasks',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        );
      },
    );
  }
}
