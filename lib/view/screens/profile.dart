import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = 'profile_page';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const  Icon(Icons.logout_rounded),
              tooltip: 'logout'),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const Text(
              'Mahmoud Badwy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.4,
              ),
            ),
            // SizedBox(height: context.getHeight()/ 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'make voice on done task',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  CupertinoSwitch(
                    value: true,
                    onChanged: (newValue) {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'sync your Data',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  CupertinoSwitch(
                    value: true,
                    onChanged: (newValue) {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.getHeight() / 20,
            ),
          ],
        ),
      ),
    );
  }
}
