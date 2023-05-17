import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = 'profile_page';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('data'),
        ],
      ),
    );
  }
}
