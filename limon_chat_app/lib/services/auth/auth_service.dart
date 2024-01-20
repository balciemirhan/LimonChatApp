// service

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // instance of auth (tüm işlevselliğe sahip olacağız)
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // get current user
  User? getCurrentUser() {
    // mevcut oturum açmış kullanıcı
    return _auth.currentUser;
  }

  // sign in

  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    /*  return _auth.signInWithEmailAndPassword(email: email, password: password); */

    // herhangi bir hata varsa try-catch ile yakalayalım.
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // save user info if it doesn't already exist.
      firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          /* "name": userCredential.user?.displayName ?? "", */
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // sign up

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // save user info in a separete doc
      firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out

  Future<void> signOut(context) async {
    return await _auth
        .signOut()
        .whenComplete(() => Navigator.of(context).pushNamed("/authGate"));
  }

  // errors
}
