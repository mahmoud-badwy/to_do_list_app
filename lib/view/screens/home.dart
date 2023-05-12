import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/view/widgets/floating_action_button.dart';
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
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
