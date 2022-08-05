// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:student_app/data/models/rating_model.dart';

class Course {
  final String id;
  final String name;
  final String description;
  final String image;
  final List<Rating>? instructorRate;
  final List<Rating>? courseRate;
  final String studentType;
  final dynamic price;
  final List<dynamic> appointments;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    this.instructorRate,
    this.courseRate,
    required this.studentType,
    required this.price,
    required this.appointments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'description': description,
      'image': image,
      'instructorRate': instructorRate,
      'courseRate': courseRate,
      'studentType': studentType,
      'price': price,
      'appointments': appointments,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      instructorRate: map['instructorRate'] != null
          ? List<Rating>.from(
              map['instructorRate']?.map(
                (element) => Rating.fromJson(element),
              ),
            )
          : null,
      courseRate: map['courseRate'] != null
          ? List<Rating>.from(
              map['courseRate']?.map(
                (element) => Rating.fromJson(element),
              ),
            )
          : null,
      studentType: map['studentType'] as String,
      price: map['price'] as dynamic,
      appointments: map['appointments'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);
}
