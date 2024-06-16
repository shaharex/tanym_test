import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';

class ProfileAppBar extends StatelessWidget {
  final String? link;

  const ProfileAppBar({super.key, this.link});

  @override
  Widget build(BuildContext context) {
    const double coverHeight = 180;
    const double profileHeight = 120;
    const top = coverHeight - profileHeight / 2;
    const bottom = profileHeight / 2;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: bottom),
          color: AppColors.primary_color,
          width: double.infinity,
          height: coverHeight,
        ),
        Positioned(
          top: top,
          child: Container(
            width: profileHeight,
            height: profileHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(link!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
