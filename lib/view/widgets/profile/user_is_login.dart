import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/sign_in_controller.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/view/widgets/profile/made_by_mahmoud.dart';

import '../../../helper/mediaquery.dart';

class UserIsLogin extends StatelessWidget {
  const UserIsLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignInController provider = context.watch<SignInController>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<SignInController>().signOut(context);
            },
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'logout',
          ),
        ],
      ),
      body: Column(
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
                  'assets/me.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.getHeight() / 50,
          ),
          Text(
            provider.credential.currentUser!.displayName!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Consumer<TasksController>(
            builder: (context, value, child) {
              return Column(
                children: [
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
                    value: value.isSoundOn,
                    onChanged: (newValue) {
                      value.setIsSoundOn(newValue);
                    },
                  ),
                  Visibility(
                    visible: value.isSoundOn,
                    child: Padding(
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
                        value: value.isFullSound,
                        onChanged: (newValue) {
                          value.setIsFullSound(newValue);
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const Spacer(),
          const MadeByMahmoud(),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
