import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/features/navigation/bottom_nav_bar.dart';
import 'package:tanymtest_app/src/features/onboarding/onboarding_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Возвращаем загрузочный индикатор, если состояние еще загружается
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // Возвращаем главную страницу при наличии данных (пользователь вошел в систему)
            return BottomNavBar();
          } else {
            // Возвращаем страницу OnboardingPage, если пользователь вышел из системы
            return OnboardingPage();
          }
        },
      ),
      // body: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return const BottomNavBar();
      //       //return const NavigationMenu();
      //     } else {
      //       return const OnboardingPage();
      //     }
      //   },
      // ),
    );
  }
}
