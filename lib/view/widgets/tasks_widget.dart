import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';

class TaskWidget extends StatelessWidget {
  final int index;
  const TaskWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Selector<TasksController, List>(
        builder: (selectContext, value, child) {
          return Card(
            color: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CheckboxListTile(
              title: Text(
                value[index][0],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  decoration: value[index][1]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding: const EdgeInsets.only(
                left: 30,
                right: 15,
              ),
              checkColor: Colors.green[900],
              value: value[index][1],
              onChanged: (value) {
                context.read<TasksController>().changeTaskStatue(value, index);
              },
            ),
          );
        },
        selector: (p0, tasksControllerObject) =>
            tasksControllerObject.myTasks.reversed.toList(),
      ),
    );
  }
}
