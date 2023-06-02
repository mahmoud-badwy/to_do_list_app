import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/sign_in_controller.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/view/widgets/home/my_alert_widget.dart';
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
              // showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     backgroundColor: Colors.yellow[200],
              //     content: const MyAlertWidget(
              //       text: 'SignOut Successfully',
              //       icon: Icons.done_rounded,
              //       color: Colors.green,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              // );
            },
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'logout',
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.sp,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.yellow[200],
                    content: const MyAlertWidget(
                        text:
                            'add image will be added in next Updata, check if you are on last Updata',
                        icon: Icons.done_rounded,
                        color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: 'profile',
                child: SizedBox(
                  width: 150.sp,
                  height: 150.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/images/user.png',
                      fit: BoxFit.cover,
                    ),
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
            SizedBox(
              height: 50.h,
            ),
            const MadeByMahmoud(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
