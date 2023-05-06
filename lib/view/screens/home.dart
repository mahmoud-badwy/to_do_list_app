import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/view/widgets/tasks_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Selector<TasksController, int>(
          builder: (context, value, child) {
            if (value != 0) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20),
                itemCount: value,
                itemBuilder: (context, index) {
                  return TaskWidget(index: index);
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
          selector: (p0, p1) => p1.myTasks.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
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
                      controller:
                          context.watch<TasksController>().inputController,
                      decoration: const InputDecoration(
                        hintText: 'task',
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      onSubmitted: (value) {
                        context
                            .read<TasksController>()
                            .addTask(taskName: value, context: context);
                      },
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<TasksController>().inputController.clear();
                      Navigator.pop(context);
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
                      context.read<TasksController>().addTask(context: context);
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
      ),
    );
  }
}
