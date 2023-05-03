import 'package:flutter/material.dart';

class TasksController with ChangeNotifier {
  List<TaskWidget> myTasks = [const TaskWidget(taskName: 'name')];
}

class TaskWidget extends StatelessWidget {
  final String taskName;
  const TaskWidget({super.key, required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Text(taskName);
  }
}
