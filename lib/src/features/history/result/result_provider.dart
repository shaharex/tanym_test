import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanymtest_app/src/features/history/result/result_model.dart';

class ResultProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String studentId = FirebaseAuth.instance.currentUser!.uid;

  List<ResultModel> results = [];

  Stream<List<ResultModel>> getResults() {
    try {
      return _firestore
          .collection('users')
          .doc(studentId)
          .collection('result')
          .snapshots()
          .asyncMap((snapshot) async {
        List<ResultModel> newResults = [];
        for (var doc in snapshot.docs) {
          var resultData = doc.data() as Map<String, dynamic>;
          newResults.add(ResultModel.fromJson(resultData));
        }
        results = newResults;
        notifyListeners();
        return newResults; // Возвращаем список результатов
      });
    } catch (e) {
      print('Ошибка при получении результатов: $e');
      return Stream.value([]); // Возвращаем пустой список в случае ошибки
    }
  }
}
