import 'package:flutter/material.dart';
import 'package:to_do_list_app/view/screens/sign_in/sign_in.dart';
import '../view/screens/home.dart';
import '../view/screens/profile.dart';
import '../view/screens/sign_in/sign_up.dart';

String myinitialRoute = SignInPage.pageRoute;
Map<String, Widget Function(BuildContext)> myRoutes() {
  return {
    MyHomePage.pageRoute: (context) => const MyHomePage(),
    ProfilePage.pageRoute: (context) => const ProfilePage(),
    SignInPage.pageRoute: (context) => const SignInPage(),
    SignUpPage.pageRoute: (context) => const SignUpPage(),
  };
}
