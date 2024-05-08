import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/components/profile_app_bar.dart';
import 'package:tanymtest_app/src/core/components/profile_section.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/onboarding/onboarding_page.dart';
import 'package:tanymtest_app/src/features/profile/edit_user_details/edit_user_details.dart';
import 'package:tanymtest_app/src/features/profile/meet/psychologists_list.dart';

import '../login/provider/auth_service.dart';

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
              link:
                  'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=',
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
                  ProfileSection(
                    text: 'Изменить профиль',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditUserDetails()));
                    },
                    icon: const Icon(
                      Icons.mode_edit_outline_outlined,
                      color: AppColors.primary_color,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  //ProfileSection(
                  //   text: 'Чат',
                  //   onTap: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => ChatsPage()));
                  //   },
                  //   icon: const Icon(
                  //     Icons.chat_bubble_outline_outlined,
                  //     color: AppColors.primary_color,
                  //     size: 30,
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  ProfileSection(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PsychologistsList()));
                    },
                    text: 'Встречи',
                    icon: const Icon(
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
