import 'package:flutter/material.dart';
import 'package:to_do_list_app/view/screens/home.dart';
import 'package:to_do_list_app/view/screens/profile.dart';
String myinitialRoute = ProfilePage.pageRoute;
Map<String, Widget Function(BuildContext)> myRoutes(){
  return {
    MyHomePage.pageRoute : (context) => const MyHomePage(),
    ProfilePage.pageRoute : (context) => const ProfilePage(),
  };
}