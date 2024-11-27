import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_text_box.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/profile/edit_user_details/user/model/user_model.dart';

import '../../../core/common/common_text_field.dart';

class EditUserDetails extends StatefulWidget {
  final UserModel userDetails;
  const EditUserDetails({super.key, required this.userDetails});

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<String> _uploadImage(File image) async {
    final ref = _storage
        .ref()
        .child('users_avatar')
        .child('${_firebaseAuth.currentUser!.uid}.jpg');

    await ref.putFile(image);
    return await ref.getDownloadURL();
  }

  Future<String> getUserId() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.uid;
    }
    throw Exception('No user logged in');
  }

  Future<void> _save() async {
    try {
      String imageUrl = '';
      if (_image != null) {
        imageUrl = await _uploadImage(_image!);
      }

      String userId = await getUserId();

      await _firestore.collection('users').doc(userId).update({
        'imageUrl': imageUrl,
        // 'name': nameController.text,
        // 'email': emailController.text,  // предполагается, что emailController существует
        // 'password': passwordController.text, // Не рекомендуется хранить пароли в открытом виде
      });
    } catch (e) {
      print(e);
    }
  }

  final TextEditingController nameController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : widget.userDetails.imageUrl != null
                            ? NetworkImage(widget.userDetails.imageUrl)
                                as ImageProvider
                            : null,
                    child: IconButton(
                      alignment: Alignment.bottomLeft,
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                      ),
                      iconSize: 30,
                      color: AppColors.white_color,
                      onPressed: () {
                        _pickImage();
                      }, //selectImage,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const CommonText(
                  size: 15,
                  text: 'Почта',
                  color: AppColors.dark_grey_color,
                ),
                CommonTextBox(text: widget.userDetails.email),
                // CommonTextField(
                //   keyboardType: TextInputType.name,
                //   controller: emailController,
                //   controller: ,
                //   hintText: 'Введите почту',
                //   obscureText: false,
                // ),
                const SizedBox(height: 10),
                const CommonText(
                  size: 15,
                  text: 'Имя, фамилия',
                  color: AppColors.dark_grey_color,
                ),
                CommonTextField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  hintText: widget.userDetails.name,
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // const CommonText(
                //   size: 15,
                //   text: 'Пароль',
                //   color: AppColors.dark_grey_color,
                // ),
                // CommonTextField(
                //   keyboardType: TextInputType.visiblePassword,
                //   controller: passwordController,
                //   hintText: 'Пароль',
                //   obscureText: false,
                // ),
                const SizedBox(height: 20),
                CommonButton(
                  itMustbe: true,
                  text: 'Сохранить',
                  onTap: () async {
                    _save();
                    await Future.delayed(Duration(milliseconds: 200));
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
