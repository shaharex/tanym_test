import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> articles = [
      {
        'title': 'Понимание Депрессии: Симптомы, Причины и Пути Решения',
        'subtitle':
            'Этот артикль представляет собой введение в тестирование на депрессию, который помогает оценить уровень депрессивных симптомов у человека',
        'image': 'assets/images/first_article.png',
        'date': '18.09.2023',
        'time': '5',
      },
      {
        'title': 'Методы Самопомощи при Депрессии: Как Преодолеть Трудности',
        'subtitle':
            'Этот артикль представляет собой введение в тестирование на депрессию, который помогает оценить уровень депрессивных симптомов у человека',
        'image': 'assets/images/second_article.png',
        'date': '18.09.2023',
        'time': '5',
      },
    ];

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
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
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
                              child: Image.asset(
                                articles[index]['image'],
                                fit: BoxFit.cover,
                                height: 150,
                                width: double.infinity,
                              ),
                            ),
                            CommonTitle(
                              text: articles[index]['title'],
                              size: 18,
                              text_align: TextAlign.start,
                            ),
                            CommonText(
                              text: articles[index]['subtitle'],
                              size: 16,
                              color: AppColors.dark_grey_color,
                              text_align: TextAlign.justify,
                              maxLines: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: articles[index]['date'],
                                  color: AppColors.grey_color,
                                ),
                                CommonText(
                                  text:
                                      '${articles[index]['time']} минут чтения',
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
  }
}
