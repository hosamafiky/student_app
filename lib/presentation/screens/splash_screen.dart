import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/presentation/features/admin/screens/admin_screen.dart';
import 'package:student_app/presentation/features/auth/screens/login_screen.dart';
import 'package:student_app/presentation/features/auth/services/auth.dart';
import 'package:student_app/presentation/features/home/screens/home_screen.dart';
import 'package:student_app/providers/user_provider.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer() {
    Timer(const Duration(seconds: 3), () async {
      AuthServices().getUserData(context).then((value) {
        var user = Provider.of<UserProvider>(context, listen: false).user;
        user.token.isEmpty
            ? Navigator.pushReplacementNamed(context, LoginScreen.routeName)
            : user.type == 'admin'
                ? Navigator.pushReplacementNamed(context, AdminScreen.routeName)
                : Navigator.pushReplacementNamed(context, HomeScreen.routeName);

      });
    });
  }

  @override
  initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.kPrimaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loading.gif',
              width: 50.0,
              height: 50.0,
              color: Palette.kPrimaryColor,
              colorBlendMode: BlendMode.colorDodge,
            ),
            const Text(
              'EDUCATION',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 38.0,
              ),
            ),
            const Text(
              'CASTLE',
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
