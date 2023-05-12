import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/model/task_model.dart';

class TaskWidget extends StatelessWidget {
  final int index;
  final String list;
  final List<TaskModel> tasks;
  const TaskWidget({
    super.key,
    required this.index,
    required this.tasks,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Card(
        color: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: CheckboxListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tasks[index].taskName,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  decoration: tasks[index].statueBool
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              tasks[index].statue == 'done'
                  ? const Text('Done')
                  : const Text(''),
            ],
          ),
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          contentPadding: const EdgeInsets.only(
            left: 30,
            right: 15,
          ),
          checkColor: Colors.green[900],
          value: tasks[index].statueBool,
          onChanged: (value) {
            context
                .read<TasksController>()
                .changeTaskStatue(value!, index, list);
          },
        ),
      ),
    );
  }
}
