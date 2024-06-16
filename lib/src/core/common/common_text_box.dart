import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';

class CommonTextBox extends StatelessWidget {
  final double? height;
  final String text;
  const CommonTextBox({
    super.key,
    this.height = 55,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white_color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.light_grey_color),
      ),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: AppColors.low_primary_color,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
    );
  }
}
