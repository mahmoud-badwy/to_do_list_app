import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/constants/controllers.dart';
import 'package:to_do_list_app/constants/theme.dart';
import 'package:to_do_list_app/view/screens/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: myControllers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myThemeData(),
        home: const MyHomePage(),
      ),
    );
  }
}
