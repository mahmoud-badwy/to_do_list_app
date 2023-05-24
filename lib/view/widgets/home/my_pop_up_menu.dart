import 'package:flutter/material.dart';

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
        // PopupMenuItem 4
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
          print(1);
        } else if (value == 2) {
          print(2);
        }
      },
    );
  }
}
