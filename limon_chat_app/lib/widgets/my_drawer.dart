import 'package:flutter/material.dart';
import 'package:limon_chat_app/services/auth/auth_service.dart';
import 'package:limon_chat_app/services/auth/google_authentication.dart';
import 'package:limon_chat_app/config/constant/themes/mediaquery.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Future<void> logout(context) async {
    /* final String loginMethod; */
    // Log out code here
    // get auth service

    /* ------------ GoogleOut  ------------ */

    final GoogleAuthentication authentication = GoogleAuthentication();
    await authentication.signOut();

    final AuthService authService = AuthService();
    await authService.signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 249, 191),
              ),
              child: Image(
                image: AssetImage("assets/images/chat.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: const Text('H O M E'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text("S E T T İ N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 25, top: AppScreenSize.screenSize(context).height / 1.9),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: () {
                logout(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
