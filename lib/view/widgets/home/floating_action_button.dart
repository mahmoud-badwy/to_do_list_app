import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<dynamic> floatingActionOnTap(BuildContext context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Add New Task',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  controller: context.watch<TasksController>().inputController,
                  decoration: const InputDecoration(
                    hintText: 'task',
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  onSubmitted: (value) {
                    context.read<TasksController>().addTask(
                          taskName: value,
                          context: context,
                        );
                  },
                ),
                CheckboxListTile(
                  value: context.watch<TasksController>().isCompleteC,
                  onChanged: (value) => context
                      .read<TasksController>()
                      .onChangeisCompleteC(value!),
                  title: const Text('mark as read'),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  context.read<TasksController>().onCancel(context);
                },
                child: const Text(
                  'cancel',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<TasksController>().addTask(
                        context: context,
                      );
                },
                child: const Text(
                  'add',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return FloatingActionButton(
      onPressed: () {
        floatingActionOnTap(context);
      },
      backgroundColor: Colors.yellow[400],
      tooltip: 'add tast',
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
