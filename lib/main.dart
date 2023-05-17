import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/constants/controllers.dart';
import 'package:to_do_list_app/constants/routes.dart';
import 'package:to_do_list_app/constants/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
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
        initialRoute: myinitialRoute,
        routes: myRoutes(),
      ),
    );
  }
}
