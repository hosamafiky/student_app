import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/strings/strings.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/data/models/user_model.dart';
import 'package:student_app/presentation/screens/enroll_success_screen.dart';
import 'package:student_app/providers/user_provider.dart';

class CourseServices {
  late Dio dio;

  CourseServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  void enroll({required BuildContext context, required Course course}) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      Response response = await dio.post(
        '/enroll-course',
        data: jsonEncode({
          'id': course.id,
        }),
        options: Options(
          contentType: 'application/json',
          headers: {
            'x-auth-token': userProvider.user.token,
          },
        ),
      );
      dioErrorHandling(
        context: context,
        response: response,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            courses: List<Course>.from(
              response.data['courses']?.map(
                (course) => Course.fromMap(course),
              ),
            ),
          );
          userProvider.setUserFromModel(user);
          nextPage(context, EnrollSuccessScreen.routeName);
        },
      );
    } catch (error) {
      if (error is DioError) {
        showSnackBar(context, error.response!.data['error']);
      } else {
        showSnackBar(context, error.toString());
      }
    }
  }

  void rate({
    required BuildContext context,
    required String id,
    required double courseRate,
    required double instructorRate,
    required String comment,
  }) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      Response response = await dio.post(
        '/rate',
        data: jsonEncode({
          'id': id,
          'instructorRate': instructorRate,
          'courseRate': courseRate,
          'comment': comment,
        }),
        options: Options(
          contentType: 'application/json',
          headers: {
            'x-auth-token': userProvider.user.token,
          },
        ),
      );
      dioErrorHandling(
        context: context,
        response: response,
        onSuccess: () {
          Navigator.pop(context);
          showSnackBar(context, 'شكرآ لك لتقييمك');
        },
      );
    } catch (error) {
      if (error is DioError) {
        showSnackBar(context, error.response!.data['error']);
      } else {
        showSnackBar(context, error.toString());
      }
    }
  }

  void exit({required BuildContext context, required Course course}) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      Response response = await dio.post(
        '/exit-course',
        data: jsonEncode({
          'id': course.id,
        }),
        options: Options(
          contentType: 'application/json',
          headers: {
            'x-auth-token': userProvider.user.token,
          },
        ),
      );
      dioErrorHandling(
        context: context,
        response: response,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            courses: List<Course>.from(
              response.data['courses']?.map(
                (course) => Course.fromMap(course),
              ),
            ),
          );
          userProvider.setUserFromModel(user);
          Navigator.pop(context);
          showSnackBar(context, 'تم إلغاء الإشتراك من الدورة بنجاح');
        },
      );
    } catch (error) {
      if (error is DioError) {
        showSnackBar(context, error.response!.data['error']);
      } else {
        showSnackBar(context, error.toString());
        log(error.toString());
      }
    }
  }
}
