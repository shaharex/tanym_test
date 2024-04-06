import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/history/history_page.dart';
import 'package:tanymtest_app/src/features/profile/profile_page.dart';
import 'package:tanymtest_app/src/features/resources/resources_page.dart';
import 'package:tanymtest_app/src/features/tests/ui/tests/tests_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages = const [
    TestsPage(),
    HistoryPage(),
    ResourcesPage(),
    ProfilePage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary_color,
        unselectedItemColor: AppColors.grey_color,
        items: const [
          BottomNavigationBarItem(
            label: "Тесты",
            icon: ImageIcon(
              AssetImage('assets/icons/tests_icon.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: "История",
            icon: ImageIcon(
              AssetImage('assets/icons/history_icon.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: "Ресурсы",
            icon: ImageIcon(
              AssetImage('assets/icons/resources_icon.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: "Профиль",
            icon: ImageIcon(
              AssetImage('assets/icons/profile_icon.png'),
            ),
          ),
        ],
      ),
    );
  }
}
