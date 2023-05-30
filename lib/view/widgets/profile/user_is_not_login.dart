import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/view/screens/sign_in/sign_in.dart';
import '../../../controller/tasks_controller.dart';
import '../../../helper/mediaquery.dart';
import 'made_by_mahmoud.dart';

class UserIsNotLogin extends StatelessWidget {
  const UserIsNotLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.sp,
            ),
            Hero(
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
            SizedBox(
              height: context.getHeight() / 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInPage.pageRoute);
              },
              child: const Text(
                'login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.4,
                ),
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
