import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/tests/ui/quiz/provider/test_provider.dart';
import 'package:tanymtest_app/src/features/tests/ui/quiz/quiz_page.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  bool isSelected = false;

  List<bool> isSelectedList = List.filled(9, false);

  final List<String> emotions = [
    'Хорошо 😊',
    'Усталость 😴',
    'Грусть 😢',
    'Счастливо 😄',
    'Взволнованно 😳',
    'Задумчиво 🤔',
    'Спокойно 😌',
    'Разочаровано 😞',
    'Беспокойно 😟',
  ];

  List<FilterChip> _buildFilterChips(
      QuizProvider quizProvider, BuildContext context) {
    return emotions.asMap().entries.map((entry) {
      int index = entry.key;
      String emotion = entry.value;
      return FilterChip(
        label: CommonText(
          size: 15,
          text_align: TextAlign.center,
          text: emotion,
          color: isSelectedList[index]
              ? AppColors.white_color
              : AppColors.dark_grey_color,
        ),
        selected: isSelectedList[index],
        onSelected: (bool value) {
          setState(
            () {
              isSelectedList[index] = value;
              if (value) {
                quizProvider.setSelectedEmotion(emotion);
              } else {
                quizProvider.removeSelectedEmotion(emotion);
              }
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.transparent),
        ),
        selectedColor: AppColors.primary_color,
        showCheckmark: false,
        backgroundColor: AppColors.light_primary_color,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white_color,
        appBar: AppBar(
          backgroundColor: AppColors.white_color,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primary_color,
              size: 32,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const CommonTitle(
                  text: 'Как вы себя чувствуете?',
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
                Image.asset(
                  'assets/images/mood_page.png',
                  height: 270,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 3.0,
                  runSpacing: 0.0,
                  children: _buildFilterChips(provider, context),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CommonButton(
                    itMustbe: true,
                    onTap: () async {
                      provider.saveEmotionList();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuizPage()));
                    },
                    text: 'Готово',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
