import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_circle.dart';
import 'package:tanymtest_app/src/core/common/common_custom_btn.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/history/history_result_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final user = FirebaseAuth.instance.currentUser!;

  Future<List<Map<String, dynamic>>> _getResultData() async {
    var resultCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('result');
    var querySnapshot = await resultCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _getResultData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No results found'));
        }
        var results = snapshot.data!;
        return Scaffold(
          backgroundColor: AppColors.background_color,
          appBar: const CommonAppBar(title: 'История'),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                var resultData = results[index];
                return Container(
                  padding: const EdgeInsets.all(15),
                  height: 130,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.white_color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTitle(text: resultData['name_of_test']),
                            CommonText(
                              text: 'сдано ${resultData['data']}',
                              size: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonCustomBtn(
                              vert: 6,
                              hor: 30,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HistoryResultPage(
                                      title_appBar: resultData['name_of_test'],
                                      counter1: resultData['depression'],
                                      counter2: resultData['neuroticism'],
                                      counter3: resultData['sincerity'],
                                      counter4: resultData['sociability'],
                                      list_of_emotions:
                                          resultData['list_of_emotions'],
                                    ),
                                  ),
                                );
                              },
                              text: 'Посмотреть результат',
                            ),
                          ],
                        ),
                        CommonCircle(
                          size: 55,
                          boxsh: false,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryResultPage(
                                    title_appBar: resultData['name_of_test'],
                                    counter1: resultData['depression'],
                                    counter2: resultData['neuroticism'],
                                    counter3: resultData['sincerity'],
                                    counter4: resultData['sociability'],
                                    list_of_emotions:
                                        resultData['list_of_emotions'],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                              color: AppColors.primary_color,
                              size: 38,
                            ),
                          ),
                        ),
                      ]),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
