import 'package:flutter/material.dart';
import 'package:limon_chat_app/auth/auth_gate.dart';
import 'package:limon_chat_app/auth/login_or_register.dart';
import 'package:limon_chat_app/pages/home_page.dart';
import 'package:limon_chat_app/pages/login/login_page.dart';
import 'package:limon_chat_app/pages/register/register_page.dart';

typedef AppRouteMapFunction = Widget Function(BuildContext context);

final class AppRoute {
  const AppRoute._();

  static const String login = "/login";
  static const String register = "/register";
  static const String loginOrRegister = "/loginOrRegister";
  static const String authGate = "/authGate";
  static const String home = "/home";

  static Map<String, AppRouteMapFunction> routes = {
    login: (context) => LoginPage(),
    register: (context) => RegisterPage(),
    loginOrRegister: (context) => const LoginOrRegister(),
    authGate: (context) => const AuthGate(),
    home: (context) => const HomePage(),
  };
}

/* Navigator.of(context).pushNamed("/login") 

Navigator.pop()
*/