import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      providers: const [],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
