import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/features/profile/meet/model/psychologist_model.dart';

class FirebaseProvider extends ChangeNotifier {
  List<PsychologistModel> psychologists = [];

  Future<void> getPsychologists() async {
    await FirebaseFirestore.instance
        .collection('psychologists')
        .get()
        .then((querySnapshot) {
      psychologists = querySnapshot.docs
          .map((doc) => PsychologistModel.fromJson(doc.data()))
          .toList();
      notifyListeners();
    });
  }
}
