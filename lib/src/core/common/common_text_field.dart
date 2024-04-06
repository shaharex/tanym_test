import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  //final String? Function(String?)? onChanged;
  //final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction? txtInpAct;
  //final String? errorMsg;
  final Widget? suffixIcon;
  final Color? suffixColor;
  const CommonTextField({
    super.key,
    required this.keyboardType,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    //this.onChanged,
    //this.validator,
    this.onTap,
    this.txtInpAct,
    this.focusNode,
    // this.errorMsg,
    this.suffixIcon,
    this.suffixColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: TextField(
        onTap: onTap,
        //  onChanged: onChanged,
        //validator: validator,
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: txtInpAct,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: suffixColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.low_primary_color,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          fillColor: AppColors.white_color,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.light_grey_color),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.dark_grey_color),
            borderRadius: BorderRadius.circular(5),
          ),
          //  errorText: errorMsg,
        ),
      ),
    );
  }
}
