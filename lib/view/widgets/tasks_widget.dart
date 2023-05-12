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
      child: Consumer<TasksController>(
        builder: (context, value, child) {
          return Card(
            color: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CheckboxListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value.myTasks[index]['name'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      decoration: value.myTasks[index]['statue']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  value.myTasks[index]['statue']
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
              value: value.myTasks[index]['statue'],
              onChanged: (value) {
                context.read<TasksController>().changeTaskStatue(value, index);
              },
            ),
          );
        },
      ),
    );
  }
}
