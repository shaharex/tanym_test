import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/components/profile_section.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/onboarding/onboarding_page.dart';
import 'package:tanymtest_app/src/features/profile/chat/chats_page.dart';
import 'package:tanymtest_app/src/features/profile/edit_user_details/edit_user_details.dart';
import 'package:tanymtest_app/src/features/profile/edit_user_details/user/model/user_model.dart';
import 'package:tanymtest_app/src/features/profile/edit_user_details/user/provider/user_provider.dart';
import 'package:tanymtest_app/src/features/profile/meet/psychologists_list.dart';

import '../login/provider/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Stream<UserModel> _userStream;

  @override
  void initState() {
    // TODO: implement initState
    _initializeStreams();
    super.initState();
  }

  void _initializeStreams() async {
    final UserProvider resultProvider = UserProvider();
    _userStream = resultProvider.getUserDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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

    Future<void> _refreshData() async {
      _initializeStreams();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        appBar: const CommonAppBar(title: "Профиль"),
        body: StreamBuilder<UserModel>(
          stream: _userStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Ошибка: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('Пользователь не найден'));
            } else {
              final user = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/images/go_ahead3.png"),
                    ),
                    CommonTitle(
                      text: user.name,
                      color: AppColors.black_color,
                      fontWeight: FontWeight.normal,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        ProfileSection(
                          text: 'Изменить профиль',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditUserDetails(userDetails: user)));
                          },
                          icon: const Icon(
                            Icons.mode_edit_outline_outlined,
                            color: AppColors.primary_color,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ProfileSection(
                          text: 'Чат',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatsPage()));
                          },
                          icon: const Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: AppColors.primary_color,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ProfileSection(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PsychologistsList()));
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
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
