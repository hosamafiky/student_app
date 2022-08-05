import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/app_router.dart';
import 'package:student_app/presentation/features/auth/screens/login_screen.dart';
import 'package:student_app/providers/user_provider.dart';

import 'presentation/screens/screens.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 1080
      title: 'EDUCATION CASTLE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF80FF72),
        ),
        fontFamily: 'Almarai',
      ),
      initialRoute: '/',
      onGenerateRoute: AppRouter().generateRoute,
      home: const SplashScreen(),
    );
  }
}
