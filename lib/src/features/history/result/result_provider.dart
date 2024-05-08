import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanymtest_app/src/features/history/result/result_model.dart';

class ResultProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String studentId = FirebaseAuth.instance.currentUser!.uid;

  List<ResultModel> results = [];

  Future<void> getResults() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(studentId)
          .collection('result')
          .get();

      List<ResultModel> newResults = [];
      for (var doc in snapshot.docs) {
        newResults
            .add(ResultModel.fromJson(doc.data() as Map<String, dynamic>));
      }

      results = newResults;
      notifyListeners();
    } catch (e) {
      print('Ошибка при получении результатов: $e');
    }
  }
}
