import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_text_field.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';

class EditUserDetails extends StatefulWidget {
  const EditUserDetails({super.key});

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> getUserId() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.uid;
    }
    throw Exception('No user logged in');
  }

  Uint8List? _image;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // void selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //
  //   setState(() {
  //     _image = img;
  //   });
  // }

  // void _saveDetails() async {
  //   String resp =
  //       await StoreData().saveData(name: nameController.text, file: _image!);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Изменить профиль',
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.white_color,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.background_color,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 45,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : CircleAvatar(
                      radius: 45,
                      backgroundColor: AppColors.light_grey_color,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                        ),
                        iconSize: 30,
                        color: AppColors.white_color,
                        onPressed: () {}, //selectImage,
                      ),
                    ),
              const SizedBox(height: 20),
              const CommonText(
                size: 15,
                text: 'Почта',
                color: AppColors.dark_grey_color,
              ),
              CommonTextField(
                keyboardType: TextInputType.name,
                controller: passwordController,
                //   controller: ,
                hintText: 'Введите почту',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              const CommonText(
                size: 15,
                text: 'Имя, фамилия',
                color: AppColors.dark_grey_color,
              ),
              CommonTextField(
                keyboardType: TextInputType.name,
                controller: nameController,
                hintText: 'Введите имя',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              const CommonText(
                size: 15,
                text: 'Пароль',
                color: AppColors.dark_grey_color,
              ),
              CommonTextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                hintText: 'Пароль',
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CommonButton(
                text: 'Сохранить',
                onTap: () {
                  // _saveDetails();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
