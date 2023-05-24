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
            children: const [
              Icon(Icons.star),
              SizedBox(
                width: 10,
              ),
              Text("Get The App")
            ],
          ),
        ),
        // PopupMenuItem 2
        PopupMenuItem(
          value: 2,
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
        PopupMenuItem(
          value: 3,
          // row with 2 children
          child: Row(
            children: const [
              Icon(Icons.star),
              SizedBox(
                width: 10,
              ),
              Text("Get The App")
            ],
          ),
        ),
        // PopupMenuItem 2
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
      offset: const Offset(0, 50),
      color: Colors.grey,
      elevation: 2,
      // on selected we show the dialog box
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
