import 'package:flutter/material.dart';
import '../view/screens/home.dart';
import '../view/screens/profile.dart';
String myinitialRoute = MyHomePage.pageRoute;
Map<String, Widget Function(BuildContext)> myRoutes(){
  return {
    MyHomePage.pageRoute : (context) => const MyHomePage(),
    ProfilePage.pageRoute : (context) => const ProfilePage(),
  };
}