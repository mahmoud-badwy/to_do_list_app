import 'package:flutter/material.dart';
import 'package:to_do_list_app/view/widgets/profile/user_is_not_login.dart';

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
              icon: const Icon(Icons.logout_rounded),
              tooltip: 'logout'),
        ],
      ),
      body: const Center(
        child: UserIsNotLogin(),
      ),
    );
  }
}


