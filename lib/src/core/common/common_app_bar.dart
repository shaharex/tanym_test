import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Color background_color;
  final Color text_color;
  final void Function()? onTap;
  final Icon? icon;
  const CommonAppBar({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.height = 90,
    this.text_color = AppColors.white_color,
    this.background_color = AppColors.primary_color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      color: background_color,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (icon != null)
                  IconButton(
                    onPressed: onTap,
                    icon: icon!,
                    iconSize: 32,
                  ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: text_color,
                    ),
                  ),
                ),
              ],
            )
          : Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: text_color,
                  ),
                ),
              ),
            ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, height);
}
