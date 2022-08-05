import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/strings/strings.dart';
import 'package:student_app/providers/user_provider.dart';

class SearchServices {
  late Dio dio;

  SearchServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<List<dynamic>> searchForCourse({
    required BuildContext context,
    required String query,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<dynamic> data = [];
    try {
      Response response = await dio.get(
        'course/search',
        queryParameters: {
          'name': query,
        },
        options: Options(
          contentType: 'application/json',
          headers: {'x-auth-token': userProvider.user.token},
        ),
      );

      dioErrorHandling(
        context: context,
        response: response,
        onSuccess: () {
          data = response.data;
        },
      );
    } catch (error) {
      if (error is DioError) {
        showSnackBar(context, error.response!.data['message']);
      } else {
        showSnackBar(context, error.toString());
      }
    }
    return data;
  }
}
