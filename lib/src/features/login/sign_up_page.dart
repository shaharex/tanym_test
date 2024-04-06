// import 'package:flutter/material.dart';
// import 'package:psychology_test_app/src/core/common/common_button.dart';
// import 'package:psychology_test_app/src/core/common/common_text_field.dart';
// import 'package:psychology_test_app/src/core/common/common_title.dart';
// import 'package:psychology_test_app/src/core/constants/app_colors.dart';
//
// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.background_color,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: <Widget>[
//                 Image.asset(
//                   'assets/images/sign_in.png',
//                   width: 303,
//                 ),
//                 const CommonTitle(
//                   text: 'Давайте создадим новый аккаунт',
//                   size: 19,
//                 ),
//                 const SizedBox(height: 25),
//                 CommonTextField(
//                   controller: emailController,
//                   hintText: 'Электронная почта',
//                   obscureText: false,
//                 ),
//                 const SizedBox(height: 15),
//                 CommonTextField(
//                   controller: passwordController,
//                   hintText: 'Пароль',
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 25),
//                 CommonButton(onTap: () {}, text: 'Создать'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
