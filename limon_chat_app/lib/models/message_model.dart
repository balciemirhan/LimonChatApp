// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timesTamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timesTamp,
  });

  // convert to a map

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': receiverID,
      'receiverID': receiverID,
      'message': message,
      'timesTamp': timesTamp,
    };
  }
}
