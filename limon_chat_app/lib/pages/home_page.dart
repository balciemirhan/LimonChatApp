import 'package:flutter/material.dart';
import 'package:limon_chat_app/pages/chat_page.dart';
import 'package:limon_chat_app/services/auth/auth_service.dart';
import 'package:limon_chat_app/services/chat/chat_services.dart';

import 'package:limon_chat_app/widgets/my_drawer.dart';
import 'package:limon_chat_app/widgets/user_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // chat && auth service ----->
  // Tüm Kullanıcıları görüntüle
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        centerTitle: true,
        title: const Text("Home"),
      ),
      // drawer
      drawer: const MyDrawer(),
      // Kullanıcı listesi oluştur ----->
      body: buildUserList(),
    );
  }

  // build a list of users except for the current logged in user.
  Widget buildUserList() {
    // Kullanıcıların akışını sağla. ----->
    return StreamBuilder(
      stream: chatService.getUserStream(),
      builder: (context, snapshot) {
        // error

        if (snapshot.hasError) {
          return const Text("Error");
        }
        // loading...

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        // return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display all users except current user.
    // e-posta mevcut kullanıcıya eşit değil mi?
    if (userData["email"] != authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          // tapped on a user -> go to chatt page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
