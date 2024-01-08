import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/theme/light_mode.dart';
import 'package:limon_chat_app/config/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,

      // --------------------------- THEME ---------------------------

      theme: AppTheme.lightMode,

      // --------------------------- ROUTE ---------------------------
      initialRoute: AppRoute.login,
      routes: AppRoute.routes,
    );
  }
}
