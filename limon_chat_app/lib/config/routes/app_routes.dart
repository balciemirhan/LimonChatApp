import 'package:flutter/material.dart';
import 'package:limon_chat_app/pages/login/login_page.dart';
import 'package:limon_chat_app/pages/register/register_page.dart';

typedef AppRouteMapFunction = Widget Function(BuildContext context);

final class AppRoute {
  const AppRoute._();

  static const String login = "/login";
  static const String register = "/register";

  static Map<String, AppRouteMapFunction> routes = {
    login: (context) => const LoginPage(),
    register: (context) => RegisterPage()
  };
}

/* Navigator.of(context).pushNamed("/login") 

Navigator.pop()
*/