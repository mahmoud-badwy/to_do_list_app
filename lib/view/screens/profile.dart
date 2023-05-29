import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/sign_in_controller.dart';
import 'package:to_do_list_app/view/widgets/profile/user_is_login.dart';
import 'package:to_do_list_app/view/widgets/profile/user_is_not_login.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = 'profile_page';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInController provider = context.watch<SignInController>();
    return provider.credential.currentUser != null
        ? const UserIsLogin()
        : const UserIsNotLogin();
  }
}
