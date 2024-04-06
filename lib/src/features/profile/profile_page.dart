import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '',
        onTap: () {
          //context.read<SignInBloc>().add(const SignOutRequired());
        },
        icon: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
