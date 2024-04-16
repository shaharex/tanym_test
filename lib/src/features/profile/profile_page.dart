import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/components/profile_app_bar.dart';
import 'package:tanymtest_app/src/core/components/profile_section.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/onboarding/onboarding_page.dart';

import '../../services/auth_service/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //sign out function
    void signOut() {
      final authService = Provider.of<AuthService>(context, listen: false);
      authService.signOut().then((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()),
        );
      }).catchError((error) {
        print('Error signing out: $error');
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        body: Column(
          children: [
            const ProfileAppBar(
              link: 'dewnfonp',
            ),
            const CommonTitle(
              text: 'Тест Тестилова',
              color: AppColors.black_color,
              fontWeight: FontWeight.normal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const ProfileSection(
                    text: 'Изменить профиль',
                    icon: Icon(
                      Icons.mode_edit_outline_outlined,
                      color: AppColors.primary_color,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ProfileSection(
                    text: 'Чат',
                    icon: Icon(
                      Icons.chat_bubble_outline_outlined,
                      color: AppColors.primary_color,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ProfileSection(
                    text: 'Встречи',
                    icon: Icon(
                      Icons.access_time,
                      color: AppColors.primary_color,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProfileSection(
                    onTap: signOut,
                    text: 'Выйти',
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: AppColors.primary_color,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
