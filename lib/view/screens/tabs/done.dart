import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';
import 'package:to_do_list_app/view/widgets/tasks_widget.dart';

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
                list: 'done',
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
