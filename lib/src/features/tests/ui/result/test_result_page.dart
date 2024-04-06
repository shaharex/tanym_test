import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/navigation/bottom_nav_bar.dart';

class TestResultPage extends StatelessWidget {
  final int counter1;
  final int counter2;
  final int counter3;
  final int counter4;
  final List<String> emotions_list;

  const TestResultPage({
    super.key,
    required this.counter1,
    required this.counter2,
    required this.counter3,
    required this.counter4,
    required this.emotions_list,
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
              onTap: () {
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
        appBar: const CommonAppBar(
          title: 'Pезультат теста',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/success.png',
                  width: MediaQuery.of(context).size.width * 0.7,
                  //width: 289,
                ),
              ),
              const Center(
                child: CommonTitle(text: 'Ваш тест успешно завершен!'),
              ),
              const SizedBox(height: 10),
              // CommonText(
              //   text: 'Ваши чуства ${emotions_list.toString()}',
              //   color: AppColors.dark_grey_color,
              // ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CommonText(
                            text: 'Шкала искренности:',
                          ),
                          CommonText(
                            text: '$counter1',
                            color: AppColors.dark_grey_color,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: AppColors.light_grey_color),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CommonText(text: 'Шкала депрессивности:'),
                          CommonText(
                            text: '$counter2',
                            color: AppColors.dark_grey_color,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: AppColors.light_grey_color),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CommonText(text: 'Шкала невротизации:'),
                          CommonText(
                            text: '$counter3',
                            color: AppColors.dark_grey_color,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: AppColors.light_grey_color),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CommonText(text: 'Шкала общительности:'),
                          CommonText(
                            text: '$counter4',
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
              Column(
                children: [
                  CommonButton(
                    onTap: () {
                      _showDialog(context);
                    },
                    text: 'Запросить отзыв',
                    pad_size: 0,
                    border_color: AppColors.primary_color,
                    text_color: AppColors.primary_color,
                    background_color: AppColors.white_color,
                  ),
                  CommonButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavBar()));
                    },
                    text: ('Вернуться в главную'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
