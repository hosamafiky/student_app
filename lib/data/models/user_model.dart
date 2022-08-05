// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:student_app/data/models/course_model.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String token;
  final String address;
  final String type;
  final String profileImage;
  final List<Course>? courses;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.token,
    required this.address,
    required this.type,
    required this.profileImage,
    this.courses,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'] ?? '',
        name = json['name'] ?? '',
        email = json['email'] ?? '',
        phone = json['phone'] ?? '',
        password = json['password'] ?? '',
        confirmPassword = json['confirmPassword'] ?? '',
        token = json['token'] ?? '',
        address = json['address'] ?? '',
        type = json['type'] ?? '',
        profileImage = json['profilePicture'] ?? '',
        courses = json['courses'] != null
            ? List<Course>.from(
                json['courses']?.map(
                  (x) => Course.fromMap(x),
                ),
              )
            : null;

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "confirmPassword": confirmPassword,
      "token": token,
      "address": address,
      "type": type,
      "profilePicture": profileImage,
      'courses': courses,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    String? token,
    String? address,
    String? type,
    String? profileImage,
    List<Course>? courses,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      token: token ?? this.token,
      address: address ?? this.address,
      type: type ?? this.type,
      profileImage: profileImage ?? this.profileImage,
      courses: courses ?? this.courses,
    );
  }
}
