import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_custom_btn.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/tests/ui/mood/mood_page.dart';

class TestsPage extends StatelessWidget {
  const TestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        appBar: const CommonAppBar(
          title: 'Тесты',
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 15,
            left: 15,
          ),
          child: ListView.separated(
            itemCount: 1,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.white_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          'assets/images/test_cover.png',
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Expanded(
                                child: CommonTitle(
                              text: 'Личный опросник ИСН',
                              size: 20,
                            )),
                            const Expanded(
                              child: CommonText(
                                text: '74 вопроса',
                                size: 16,
                                text_align: TextAlign.start,
                              ),
                            ),
                            const Expanded(
                              child: CommonText(
                                text: '06.04.2024 - срок сдачи',
                                size: 16,
                                text_align: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: CommonCustomBtn(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MoodPage(),
                                    ),
                                  );
                                },
                                hor: 50,
                                vert: 6,
                                text: 'Сдать тест',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
