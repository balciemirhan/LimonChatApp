import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message,
    required this.isCurrentUser,
  }) : super(key: key);

  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isCurrentUser ? Colors.green : Colors.yellow,
      ),
      child: Text(
        message,
        style: TextStyle(color: isCurrentUser ? Colors.white : Colors.black),
      ),
    );
  }
}
