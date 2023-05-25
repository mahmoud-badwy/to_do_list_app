import 'package:flutter/material.dart';
import '../../../helper/mediaquery.dart';

class MyAlertWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const MyAlertWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: context.getHeight() / 40,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            radius: 27,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
        )
      ],
    );
  }
}
