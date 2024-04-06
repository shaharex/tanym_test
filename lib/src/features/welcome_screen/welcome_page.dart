import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/login/sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CommonTitle(
              text: 'Добро пожаловать в PsycoTest!',
              size: 37,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CommonText(
                text:
                    'Пройдите нашу психологическую проверку и узнайте больше о своей личности, эмоциях и сильных сторонах. Начните свой путь к самопознанию прямо сейчас!',
                size: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.low_primary_color,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/welcome.png'),
            const SizedBox(height: 20),
            CommonButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
                text: 'Давайте начнем!')
          ],
        ),
      ),
    );
  }
}
