// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/features/account/screens/courses_screen.dart';
import 'package:student_app/presentation/features/account/screens/notifications_screen.dart';
import 'package:student_app/presentation/features/account/screens/profile_screen.dart';
import 'package:student_app/presentation/features/auth/screens/login_screen.dart';
import 'package:student_app/presentation/features/home/screens/home_screen.dart';
import 'package:student_app/providers/user_provider.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);

  List<String> titles = [
    'الرئيسية',
    'الملف الشخصي',
    'الإشعارات',
    'الدورات',
    'دوراتي',
    'آراء ونتائج طلابنا',
    'تلخيصات المراجع',
    'مواضيع جديدة',
    'مكتبة المواضيع',
    'أسئلة مشتركة',
    'طلبات المراجعة',
    'إختبارات تجريبية',
    'من نحن',
    'اتصل بنا',
  ];

  navigateToScreenWithIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, HomeScreen.routeName);
        break;
      case 1:
        Navigator.pushNamed(context, ProfileScreen.routeName);
        break;
      case 2:
        Navigator.pushNamed(context, NotificationsScreen.routeName);
        break;
      case 3:
        Navigator.pushNamed(context, CoursesScreen.routeName);
        break;
      case 4:
        //My Courses
        break;
      case 5:
        // Student Ratings
        break;
      case 6:
        // تلخيصات المراجع
        break;
      case 7:
        // مواضيع جديدة
        break;
      case 8:
        // مكتبة المواضيع
        break;
      case 9:
        // أسئلة مشتركة
        break;
      case 10:
        // طلبات المراجعة
        break;
      case 11:
        // إختبارات تجريبية
        break;
      case 12:
        // من نحن
        break;
      case 13:
        // اتصل بنا
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.getProportionalHeight(context, 25.0),
          horizontal: SizeConfig.getProportionalWidth(context, 16.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.getProportionalHeight(context, 5.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(user.profileImage),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: SizeConfig.getProportionalWidth(context, 8.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${user.phone}+',
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          letterSpacing: 1.05,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.getProportionalHeight(context, 25.0),
            ),
            const Divider(
              height: 2.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.getProportionalHeight(context, 5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: titles
                      .asMap()
                      .map((index, title) => MapEntry(
                            index,
                            GestureDetector(
                              onTap: () =>
                                  navigateToScreenWithIndex(context, index),
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ))
                      .values
                      .toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: SizeConfig.getProportionalHeight(context, 40.0),
                  child: TextButton(
                    child: const Text(
                      'تسحيل خروج',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('x-auth-token', '').then((value) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.routeName,
                          (route) => false,
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
