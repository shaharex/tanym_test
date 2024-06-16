class UserModel {
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  final String phone;
  final String gender;
  final String password;
  final String school_id;
  final String group_id;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.phone,
    required this.gender,
    required this.password,
    required this.school_id,
    required this.group_id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] ?? 'ID не найден',
        name: json['name'] ?? 'Имя не найдено',
        email: json['email'] ?? 'Email не найден',
        imageUrl: json['imageUrl'] ??
            'https://samarkand.itcamp.uz/assest/img/reviews/no-pic-ava.jpg',
        phone: json['phone'] ?? 'Номер не найден',
        gender: json['gender'] ?? 'Пол не найден',
        password: json['password'] ?? 'Пароль не найден',
        school_id: json['school_id'] ?? 'ID школы не найден',
        group_id: json['group_id'] ?? 'ID группы не найден',
      );
}
