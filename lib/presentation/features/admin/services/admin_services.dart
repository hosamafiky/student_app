import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/strings/strings.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/providers/user_provider.dart';

class AdminServices {
  late Dio dio;

  AdminServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  void addCourse({
    required BuildContext context,
    required String name,
    required String description,
    required String price,
    required String studentType,
    required File image,
    required List<String> appointments,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String imageUrl = '';
    final cloudinary = CloudinaryPublic('dmjcceeio', 'bzxvefyi');

    try {
      cloudinary
          .uploadFile(
        CloudinaryFile.fromFile(
          image.path,
          folder: name.trim(),
        ),
      )
          .then((value) async {
        imageUrl = value.secureUrl;
        Course course = Course(
          id: '',
          name: name,
          description: description,
          image: imageUrl,
          studentType: studentType,
          price: double.parse(price),
          appointments: appointments,
          instructorRate: [],
          courseRate: [],
        );
        Response response = await dio.post(
          '/admin/addcourse',
          data: course.toJson(),
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
            showSnackBar(context, 'تم إضافة الدورة بنجاح');
            getCourses(context: context);
            Navigator.pop(context);
          },
        );
      });
    } catch (error) {
      if (error is DioError) {
        showSnackBar(context, error.response!.data['message']);
      } else {
        showSnackBar(context, error.toString());
      }
    }
  }

  void deleteCourse({
    required BuildContext context,
    required String id,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      Response response = await dio.post(
        '/admin/deletecourse',
        data: {
          'id': id,
        },
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
          showSnackBar(context, 'تم حذف الدورة بنجاح');
        },
      );
    } catch (error) {
      if (error is DioError) {
        showSnackBar(context, error.response!.data['message']);
      } else {
        showSnackBar(context, error.toString());
      }
    }
  }

  Future<List<dynamic>> getCourses({required BuildContext context}) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    List<dynamic> result = [];
    try {
      Response response = await dio.get(
        '/admin/courses',
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
          result = response.data;
        },
      );
    } catch (error) {
      if (error is DioError) {
        showSnackBar(context, error.response!.data['message']);
      } else {
        showSnackBar(context, error.toString());
      }
    }
    return result;
  }
}
