import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:limon_chat_app/models/message_model.dart';

class ChatService {
  // get instance of firestore & auth ----->
  // paketi içe aktar
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  /* get user stream ----->
 kullanıcıları elde etmek ve ekranda görüntülemek için: (kullanıcı akışı oluştur)
 List<Map<String,dynamic> (harita):

 [
  {
    'email':test@gmail.com 
     "id": ....

  } 
  {
    'email':test2@gmail.com
     "id": ....

  } 
 ]
  */

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return firestore.collection("Users").snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            // go through each individual user ----->
            // her bir kullanıcıyı tek tek inceleyip geri döneceğiz.
            final user = doc.data();

            // return user ----->
            return user;
          },
        ).toList();
      },
    );
  }

// Timestamp'ler, zamanla ilgili bilgileri güvenli ve doğru bir şekilde saklamak için önemli bir araçtır. Bir olayın meydana geldiği veya bir verinin oluşturulduğu anı temsil eden bir değerdir.
// Timestamp'ler, veritabanlarında, dosya sistemlerinde, işletim sistemlerinde ve diğer birçok uygulamada yaygın olarak kullanılır.

// send message ----->

  Future<void> sendMessage(String receverID, message) async {
    // get current user info
    //  mevcut kullanıcı bilgilerini al
    final String currentUserID = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email!;
    // Kullanıcı mesaj gönderdiğinde bu bilgiyi topla:
    final Timestamp timestamp = Timestamp.now();

    // create new message
    // yeni mesaj oluştur
    Message newMessage = Message(
        senderID: currentUserEmail,
        senderEmail: currentUserID,
        receiverID: receverID,
        message: message,
        timesTamp: timestamp);

    // tüm bu mesajları saklamak için,
    // Bu iki kullanıcı için bir sohbet odası kimliği oluştur.
    // construct chat room ID for the two users (sorted to ensure uniqueness)
    // Mevcut kullanıcı kimliği ve alıcı'nın kimliği.
    List<String> ids = [currentUserID, receverID];
    ids.sort(); // sort the ids (this ensure the chatroomID is the same for any 2 people)
    String chatRoomID = ids.join("_");

    // add new message to database.
    // veritabanına yeni mesaj ekleyin.
    await firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get message ----->

  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    // construct a chatroom ID for the two users
    // iki kullanıcı için bir sohbet odası kimliği oluştur.
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join("_");

    return firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
