import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limon_chat_app/auth/login_or_register.dart';
import 'package:limon_chat_app/pages/home_page.dart';

// dinleyici --> kullanıcı'nın giriş yapıp yapmadığını kontrol edeceğim.
class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user in logged in
          if (snapshot.hasData) {
            return const HomePage();
          }

          // user is NOT logged in
          return const LoginOrRegister();
        },
      ),
    );
  }
}
