import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';
import 'package:to_do_list_app/view/widgets/profile/made_by_mahmoud.dart';

class UserIsNotLogin extends StatelessWidget {
  const UserIsNotLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(
          flex: 2,
        ),
        Hero(
          tag: 'profile',
          child: SizedBox(
            width: context.getWidth() / 2.5,
            height: context.getWidth() / 2.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                'assets/images/user.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: context.getHeight() / 50,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            'login',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        SwitchListTile(
          activeTrackColor: Colors.green[200],
          activeColor: Colors.black,
          title: const Text(
            'make voice on done task',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          value: context.watch<TasksController>().isSoundOn,
          onChanged: (newValue) {
            context.read<TasksController>().setIsSoundOn(newValue);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SwitchListTile(
            activeTrackColor: Colors.green[200],
            activeColor: Colors.black,
            title: const Text(
              'play full sound',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            value: context.watch<TasksController>().isFullSound,
            onChanged: (newValue) {
              context.read<TasksController>().setIsFullSound(newValue);
            },
          ),
        ),
        const Spacer(),
        const MadeByMahmoud(),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
