import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../controller/tasks_controller.dart';
import '../../../controller/toggle_tabs.dart';
import 'my_alert_widget.dart';

class TaskWidget extends StatelessWidget {
  final int index;
  final List<Map> tasks;
  final String screen;
  const TaskWidget({
    super.key,
    required this.index,
    required this.tasks,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    ToggleTabsController toggleTabsController =
        context.read<ToggleTabsController>();
    TasksController tasksController = context.read<TasksController>();
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(20),
              onPressed: (p1) {
                tasksController.delete(tasks[index]['id']);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            const SizedBox(
              width: 5,
            ),
            SlidableAction(
              onPressed: (p1) {
                if (toggleTabsController.curruntTab == 2) {
                  tasksController.removeFromArchive(tasks[index]['id'],
                      typeDone: tasks[index]['typeDone']);
                } else {
                  tasksController.addToArchive(tasks[index]['id']);
                }
              },
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.green[200]!,
              foregroundColor: Colors.white,
              icon: toggleTabsController.curruntTab == 2
                  ? Icons.unarchive
                  : Icons.unarchive,
              label: toggleTabsController.curruntTab == 2
                  ? 'UnArchive'
                  : 'Archive',
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                if (tasks[index]['kind'] == 'done') {
                  Share.share(
                    'Hi, I have a new Done task 🥰 thats is ${tasks[index]['note']}',
                  );
                } else if (tasks[index]['kind'] == 'archive') {
                  Share.share(
                    'Hi, I have a new Done task 🥰 thats is ${tasks[index]['note']}',
                  );
                } else {
                  Share.share(
                    'Hi, I have a new thats is ${tasks[index]['note']}',
                  );
                }
              },
              spacing: 0.5,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
            ),
          ],
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
                Flexible(
                  child: Text(
                    "${tasks[index]['note']}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      decoration: tasks[index]['typeDone'] == 'done'
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                tasks[index]['typeDone'] == 'done'
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
            value: tasks[index]['typeDone'] == 'done',
            onChanged: (value) {
              if (toggleTabsController.curruntTab == 2) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.yellow[200],
                    content: MyAlertWidget(
                      icon: Icons.done_rounded,
                      text:
                          'You Can\'t control on task in Archive.\ntry move it from archive before.',
                      color: Colors.green[400]!,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              } else {
                context.read<TasksController>().changeTaskStatue(
                    value!, index, tasks[index]['id'], screen);
              }
            },
          ),
        ),
      ),
    );
  }
}
