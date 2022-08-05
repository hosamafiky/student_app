import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/strings/strings.dart';
import 'package:student_app/data/models/user_model.dart';
import 'package:student_app/presentation/features/admin/screens/admin_screen.dart';
import 'package:student_app/presentation/features/home/screens/home_screen.dart';
import 'package:student_app/providers/user_provider.dart';

class AuthServices {
  late Dio dio;

  AuthServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: 20 * 1000,
        sendTimeout: 20 * 1000,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  // Register Method
  void userRegister(
    context, {
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    User user = User(
      id: '',
      name: name,
      email: email,
      password: password,
      phone: phone,
      confirmPassword: confirmPassword,
      token: '',
      address: '',
      type: 'student',
      profileImage: '',
      courses: [],
    );
    dio
        .post(
      'register',
      data: json.encode(user.toMap()),
    )
        .then((value) {
      dioErrorHandling(
        context: context,
        response: value,
        onSuccess: () {
          showSnackBar(context, 'تم تسجيل الحساب بنجاح');
        },
      );
    }).catchError((error) {
      showSnackBar(context, error.response!.data['message']);
    });
  }

  // Login Method
  void userLogin(
    context, {
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        'login',
        data: {
          'phone': phone,
          'password': password,
        },
      );
      dioErrorHandling(
        context: context,
        response: response,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.data);
          await prefs.setString('x-auth-token', response.data['token']);
          response.data['type'] == 'admin'
              ? Navigator.pushReplacementNamed(context, AdminScreen.routeName)
              : Navigator.pushReplacementNamed(context, HomeScreen.routeName);
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

  Future getUserData(context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('x-auth-token');

      if (token == null) prefs.setString('x-auth-token', '');

      Response tokenResponse = await dio.post(
        'tokencheck',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token': token,
          },
        ),
      );

      var tokenCheck = tokenResponse.data;
      if (tokenCheck == true) {
        Response userResponse = await dio.get('user',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'x-auth-token': token,
              },
            ));

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.data);
      }
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }
}
