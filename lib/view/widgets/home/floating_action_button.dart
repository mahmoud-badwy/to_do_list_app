import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/tasks_controller.dart';

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
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Task',
                    style: TextStyle(
                      fontSize: 22.sp,
                    ),
                  ),
                  TextField(
                    autofocus: true,
                    controller:
                        context.watch<TasksController>().inputController,
                    decoration: const InputDecoration(
                      hintText: 'task',
                    ),
                    style: TextStyle(
                      fontSize: 20.sp,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<TasksController>().onCancel(context);
                        },
                        child: Text(
                          'cancel',
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<TasksController>().addTask(
                                context: context,
                              );
                        },
                        child: Text(
                          'add',
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
