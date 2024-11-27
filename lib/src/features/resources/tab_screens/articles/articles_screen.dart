import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> getResultData() async {
      var resultCollection = FirebaseFirestore.instance.collection('articles');
      var querySnapshot = await resultCollection.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    }

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getResultData(),
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
        var results = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonTitle(text: 'Новые статьи'),
              SizedBox(
                height: 390,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    var resultData = results[index];
                    return GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(resultData['link']);
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 360,
                        child: Card(
                          color: AppColors.white_color,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    resultData['picture'],
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              height: 130,
                                              "assets/images/empty.png",
                                              fit: BoxFit.fitHeight,
                                            ),
                                            const Text(
                                              "Error loading image",
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                CommonTitle(
                                  text: resultData['title'],
                                  size: 18,
                                  text_align: TextAlign.start,
                                ),
                                CommonText(
                                  text: resultData['subtitle'],
                                  size: 16,
                                  color: AppColors.dark_grey_color,
                                  text_align: TextAlign.justify,
                                  maxLines: 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                      text: resultData['date'],
                                      color: AppColors.grey_color,
                                    ),
                                    CommonText(
                                      text:
                                          '${resultData['read_time']} минут чтения',
                                      color: AppColors.grey_color,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
