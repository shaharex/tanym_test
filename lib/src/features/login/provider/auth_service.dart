import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //instance for authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance for firestore
  //final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // sign user in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      //sign in
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } // catch errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
