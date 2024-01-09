import 'package:flutter/material.dart';
import 'package:limon_chat_app/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> logout(context) async {
    // Log out code here
    // get auth service
    final AuthService authService = AuthService();
    await authService.signOut(context);
    /* Navigator.of(context).pushNamed("/login"); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text("Home"),
        actions: [
          // logout button
          IconButton(
              onPressed: () => logout(context), icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
