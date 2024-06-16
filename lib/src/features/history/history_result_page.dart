import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/navigation/bottom_nav_bar.dart';

class HistoryResultPage extends StatelessWidget {
  final String title_appBar;
  final int counter1;
  final int counter2;
  final int counter3;
  final int counter4;
  final List<dynamic> list_of_emotions;

  const HistoryResultPage({
    super.key,
    required this.title_appBar,
    required this.counter1,
    required this.counter2,
    required this.counter3,
    required this.counter4,
    required this.list_of_emotions,
  });

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white_color,
          icon: const Icon(
            Icons.check_circle_rounded,
            size: 66,
            color: AppColors.primary_color,
          ),
          title: const CommonTitle(text: "Ваш запрос отправлен!"),
          content: const CommonText(
            text: "Ваш запрос успешно отправлен. Ждите ответа психолога.",
            size: 16,
            color: AppColors.dark_grey_color,
          ),
          actions: <Widget>[
            CommonButton(
              itMustbe: true,
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBar()));
              },
              text: 'Вернуться в главную',
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.white_color,
          ),
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Результаты теста',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.white_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTitle(text: '$title_appBar'),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 140,
                                  child: CommonText(
                                    text: 'Искренность',
                                    text_align: TextAlign.start,
                                  ),
                                ),
                                CommonText(
                                  text: '$counter1/74',
                                  color: AppColors.dark_grey_color,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(color: AppColors.light_grey_color),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 140,
                                  child: CommonText(
                                    text: 'Депрессивность',
                                    text_align: TextAlign.start,
                                  ),
                                ),
                                CommonText(
                                  text: '$counter2/74',
                                  color: AppColors.dark_grey_color,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(color: AppColors.light_grey_color),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 140,
                                  child: CommonText(
                                    text: 'Невротизации',
                                    text_align: TextAlign.start,
                                  ),
                                ),
                                CommonText(
                                  text: '$counter3/74',
                                  color: AppColors.dark_grey_color,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(color: AppColors.light_grey_color),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 140,
                                  child: CommonText(
                                    text: 'Общительность',
                                    text_align: TextAlign.start,
                                  ),
                                ),
                                CommonText(
                                  text: '$counter4/74',
                                  color: AppColors.dark_grey_color,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(color: AppColors.light_grey_color),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 220,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.white_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommonTitle(
                      text: 'Ваше самочуствие во время прохождения теста',
                      text_align: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    CommonText(
                      text: list_of_emotions.join(', '),
                    ),
                  ],
                ),
              ),
              CommonButton(
                itMustbe: true,
                onTap: () async {
                  _showDialog(context);
                },
                text: 'Записаться к психологу',
                pad_size: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
