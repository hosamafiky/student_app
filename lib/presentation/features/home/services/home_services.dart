import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/strings/strings.dart';
import 'package:student_app/providers/user_provider.dart';

class HomeServices {
  late Dio dio;

  HomeServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<List<dynamic>> getCourses({required BuildContext context}) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    List<dynamic> result = [];
    try {
      Response response = await dio.get(
        '/courses',
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

  Future<List<dynamic>> getBestCourses({required BuildContext context}) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    List<dynamic> result = [];
    try {
      Response response = await dio.get(
        '/best-courses',
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
