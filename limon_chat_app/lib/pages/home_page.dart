import 'package:flutter/material.dart';
import 'package:limon_chat_app/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void logout() {
    // Log out code here
    // get auth service
    final AuthService authService = AuthService();
    authService.signOut();
    /*  Navigator.of(context).pushNamed("/login"); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          // logout button
          IconButton(onPressed: () => logout, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
