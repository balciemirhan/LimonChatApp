// oturum açma kayıt dosyası.

import 'package:flutter/material.dart';
import 'package:limon_chat_app/pages/login/login_page.dart';
import 'package:limon_chat_app/pages/register/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
// initially show login page
  bool showLoginPage = true;

// toggle between login
  void togglePages() {
    setState(
      () {
        showLoginPage = !showLoginPage;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // derleme yöntemi:

    return showLoginPage
        ? LoginPage(onTap: togglePages)
        : RegisterPage(onTap: togglePages);
  }
}
