import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tanymtest_app/src/features/profile/edit_user_details/user/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> getUserId() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.uid;
    }
    throw Exception('No user logged in');
  }

  String userId = FirebaseAuth.instance.currentUser!.uid;

  Stream<UserModel> getUserDetails() {
    try {
      // String userId = getUserId();
      return _firestore
          .collection('users')
          .doc(userId)
          .snapshots()
          .map((snapshot) => UserModel.fromJson(snapshot.data() ?? {}));
    } catch (e) {
      print('Ошибка при получении результатов: $e');
      return Stream.value(UserModel(
          uid: '',
          name: 'Ошибка',
          email: '',
          imageUrl: '',
          phone: '',
          gender: '',
          password: '',
          school_id: '',
          group_id: ''));
    }
  }
}
