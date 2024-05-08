import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/tests/ui/quiz/models/question_status.dart';

class ProgressDotWidget extends StatelessWidget {
  final QuestionStatus status;
  final int index;
  final Function()? onTap;

  const ProgressDotWidget({
    super.key,
    required this.status,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color background_color;
    Color border_color;
    Color text_color;

    switch (status) {
      case QuestionStatus.Passed:
        background_color = AppColors.primary_color;
        border_color = AppColors.primary_color;
        text_color = AppColors.white_color;

        break;
      case QuestionStatus.Current:
        background_color = AppColors.white_color;
        border_color = AppColors.primary_color;
        text_color = AppColors.primary_color;

        break;
      case QuestionStatus.NotReached:
        background_color = AppColors.white_color;
        border_color = AppColors.light_grey_color;
        text_color = AppColors.primary_color;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: background_color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: border_color, width: 2),
        ),
        child: Center(
          child: Text(
            (index).toString(),
            style: TextStyle(
              fontSize: 15,
              color: text_color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
