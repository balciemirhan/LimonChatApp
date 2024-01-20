import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/neu_box.dart';
import 'package:limon_chat_app/services/auth/auth_service.dart';
import 'package:limon_chat_app/services/chat/chat_services.dart';
import 'package:limon_chat_app/widgets/chat_bubble.dart';
import 'package:limon_chat_app/widgets/my_textformfield.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    Key? key,
    required this.receiverEmail,
    required this.receiverID,
  }) : super(key: key);

  final String receiverEmail;
  final String receiverID;

  // text controller
  final TextEditingController messageController = TextEditingController();

  // chat & auth services
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  // send Message
  void sendMessage() async {
    // if there is something inside the textfield.
    if (messageController.text.isNotEmpty) {
      // send the message
      await chatService.sendMessage(receiverID, messageController.text);

      // clear text controller
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(
            child: buildMessageList(),
          ),

          // user input
          buildInput(),
        ],
      ),
    );
  }

  // build message list

  Widget buildMessageList() {
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return const Text("Error");
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        // return list view
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // build Message Item
  Widget buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current
    bool isCurrentUser = data['senderID'] == authService.getCurrentUser()!.uid;

    // align message to the right if sender is the current, otherwise left.
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(message: data["message"], isCurrentUser: isCurrentUser),
        ],
      ),
    );
  }

  // build message input
  Widget buildInput() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // textfield should take up most of the space
          MyTextFormField(
            controller: messageController,
            hintText: "Type a message",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: NeuBox(
              child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.green,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
