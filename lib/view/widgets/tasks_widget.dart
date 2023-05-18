import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      child: Slidable(

        startActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(20),
              onPressed: (context) {},
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
                context.read<TasksController>().addToArchive(index, list);
              },
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.green[200]!,
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: 'Archive',
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [

            SlidableAction(

              onPressed: (context) {},
              spacing: 0.5,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: const  Color(0xFF0392CF),
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
                    tasks[index].taskName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      decoration: tasks[index].statueBool
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
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
      ),
    );
  }
}
