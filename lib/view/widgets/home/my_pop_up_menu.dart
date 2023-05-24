import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';

class MyPopUpMenuButton extends StatelessWidget {
  const MyPopUpMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
      itemBuilder: (context) => [
        // PopupMenuItem 1
        PopupMenuItem(
          value: 1,
          // row with 2 children
          child: Row(
            children: [
              Icon(
                Icons.done_all_rounded,
                color: Colors.green[400],
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Done All")
            ],
          ),
        ),
        // PopupMenuItem 2
        PopupMenuItem(
          value: 2,
          // row with two children
          child: Row(
            children: [
              Icon(
                Icons.delete,
                color: Colors.red[400],
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Delete All")
            ],
          ),
        ),
        // PopupMenuItem 3
        PopupMenuItem(
          value: 3,
          // row with two children
          child: Row(
            children: [
              Icon(
                Icons.archive_rounded,
                color: Colors.red[400],
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Archive All")
            ],
          ),
        ),
        // PopupMenuItem 4
        PopupMenuItem(
          value: 4,
          // row with 2 children
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.orange[300],
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Rate The App")
            ],
          ),
        ),
        // PopupMenuItem 5
        PopupMenuItem(
          value: 4,
          // row with two children
          child: Row(
            children: const [
              Icon(Icons.chrome_reader_mode),
              SizedBox(
                width: 10,
              ),
              Text("About")
            ],
          ),
        ),
      ],
      offset: const Offset(-20, 40),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: (value) {
        if (value == 1) {
          context.read<TasksController>().doneAll();
        } else if (value == 2) {
          context.read<TasksController>().deleteAll();
        } else if (value == 3) {
          context.read<TasksController>().archiveAll();
        }
      },
    );
  }
}
