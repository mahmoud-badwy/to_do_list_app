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
            return const Center(child: Text('you have no tasks'));
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
                title: const Text('Add New Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'task',
                      ),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TasksController>().addTask('mahmoud', false);
                      Navigator.pop(context);
                    },
                    child: const Text('add'),
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
