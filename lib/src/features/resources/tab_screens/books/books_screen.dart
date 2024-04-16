import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_custom_btn.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/components/rating_widget.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> _getResultData() async {
      var resultCollection = FirebaseFirestore.instance.collection('books');
      var querySnapshot = await resultCollection.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    }

    return FutureBuilder(
        future: _getResultData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary_color,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Container();
          }
          var books = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              scrollDirection: Axis.vertical,
              itemCount: books.length,
              itemBuilder: (context, index) {
                var resultData = books[index];
                return Container(
                  height: 190,
                  decoration: BoxDecoration(
                    color: AppColors.white_color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            resultData['image'],
                            fit: BoxFit.cover,
                            height: 170,
                            width: 120,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTitle(
                                text: resultData['title'],
                                size: 20,
                              ),
                              CommonText(
                                text: resultData['subtitle'],
                              ),
                              RatingWidget(
                                rating: resultData['rating'].toDouble(),
                              ),
                              CommonCustomBtn(
                                  onTap: () async {
                                    final url = Uri.parse(resultData['link']);
                                    if (!await launchUrl(url)) {
                                      throw Exception('Could not launch $url');
                                    }
                                  },
                                  hor: 65,
                                  vert: 6,
                                  text: 'Перейти')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
