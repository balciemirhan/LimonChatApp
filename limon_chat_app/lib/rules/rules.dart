import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limon_chat_app/services/auth/login_or_register.dart';
import 'package:limon_chat_app/pages/home_page.dart';
import 'package:limon_chat_app/widgets/snackbar_widget.dart';

//Conditions:

// Auth Gate Conditions:

Widget firebaseAuthConditions(AsyncSnapshot<User?> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.black),
    );
  } else if (snapshot.hasError) {
    return const Center(
      child: Text("Hata oluştu!"),
    );
  } else if (snapshot.hasData) {
    return HomePage();
  } else {
    return const LoginOrRegister();
  }
}

String forgotPasswordRules(FirebaseAuthException e, String message, context) {
  if (e.code == "invalid-email") {
    message = "Geçersiz e-posta";
  } else if (e.code == "network-request-failed") {
    message = "Ağ Hatası";
  } else if (e.code == "user-not-found") {
    message = "Kullanıcı bulunamadı.";
  }
  snackBarWidget(context, message);
  return message;
}






 /*  final authStateRules = {
  ConnectionState.waiting: () => const Center(
        child: CircularProgressIndicator(color: Colors.black),
      ),
  ConnectionState.active: () => const HomePage(),
  ConnectionState.done: () => const LoginOrRegister(),
  ConnectionState.none: () => const Center(
        child: Text("Hay aksi bir şeyler ters gitti!"),
      ),
};
 
  return authStateRules[snapshot.connectionState]!();  */ 

