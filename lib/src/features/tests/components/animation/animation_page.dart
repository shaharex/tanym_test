import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/tests/components/animation/model/animation_model.dart';

class AnimationPage extends StatelessWidget {
  final AnimationModel data;
  const AnimationPage({
    required this.data,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white_color,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: CommonTitle(
                  text: data.title,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Image.asset(
                  data.image,
                  height: 400,
                ),
              ),
              Center(
                child: CommonText(
                  text: data.text,
                  size: 17,
                  maxLines: 5,
                  fontWeight: FontWeight.normal,
                  color: AppColors.dark_grey_color,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CommonButton(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  text: data.btn_text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
