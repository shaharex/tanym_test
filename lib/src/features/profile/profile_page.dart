import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
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

    return Scaffold(
      appBar: CommonAppBar(
        title: '',
        onTap: signOut,
        boolean: true,
        icon: const Icon(
          Icons.logout_outlined,
          color: AppColors.white_color,
        ),
      ),
    );
  }
}
