import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_circle.dart';
import 'package:tanymtest_app/src/core/common/common_custom_btn.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/history/history_result_page.dart';
import 'package:tanymtest_app/src/features/history/result/result_provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

//|| snapshot.data!.isEmpty
class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    initResultLoading();
    super.initState();
  }

  Future<void> initResultLoading() async {
    try {
      await Provider.of<ResultProvider>(context, listen: false).getResults();
    } catch (e) {
      print("Ошибка при загрузке групп: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResultProvider>(
      builder: (context, resultProvider, child) {
        if (resultProvider.results.isEmpty) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.background_color,
              appBar: const CommonAppBar(title: 'История'),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Image.asset(
                        'assets/images/empty.png',
                        width: 200,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: CommonText(
                        color: AppColors.grey_color,
                        text:
                            'История пройденных тестов недоступна, так как вы еще не прошли ни один из них.',
                        text_align: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.background_color,
            appBar: const CommonAppBar(title: 'История'),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: resultProvider.results.length,
                itemBuilder: (context, index) {
                  var resultData = resultProvider.results[index];
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
                            CommonTitle(
                                text: resultData.name_of_test.toString()),
                            CommonText(
                              text: 'сдано ${resultData.data}',
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
                                      title_appBar: resultData.name_of_test,
                                      counter1: resultData.depression,
                                      counter2: resultData.neuroticism,
                                      counter3: resultData.sincerity,
                                      counter4: resultData.sociability,
                                      list_of_emotions:
                                          resultData.list_of_emotions,
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
                                    title_appBar: resultData.name_of_test,
                                    counter1: resultData.depression,
                                    counter2: resultData.neuroticism,
                                    counter3: resultData.sincerity,
                                    counter4: resultData.sociability,
                                    list_of_emotions:
                                        resultData.list_of_emotions,
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
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
