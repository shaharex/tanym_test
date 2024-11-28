import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_custom_btn.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PodcastsScreen extends StatelessWidget {
  const PodcastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> getResultData() async {
      var resultCollection = FirebaseFirestore.instance.collection('podcasts');
      var querySnapshot = await resultCollection.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    }

    return FutureBuilder(
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
        var podcasts = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              mainAxisExtent: 300,
            ),
            itemCount: podcasts.length,
            itemBuilder: (context, index) {
              var resultData = podcasts[index];
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white_color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          resultData['image'],
                          width: double.maxFinite,
                          height: 170,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary_color,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
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
                        maxLines: 2,
                        text_align: TextAlign.start,
                      ),
                      CommonText(
                        text: resultData['subtitle'],
                      ),
                      CommonCustomBtn(
                        onTap: () async {
                          final url = Uri.parse(resultData['link']);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        hor: 15,
                        vert: 5,
                        text: 'Перейти',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
