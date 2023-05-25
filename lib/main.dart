import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constants/controllers.dart';
import 'constants/routes.dart';
import 'constants/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
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
