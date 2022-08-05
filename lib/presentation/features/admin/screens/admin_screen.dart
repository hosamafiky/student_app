import 'package:flutter/material.dart';
import 'package:student_app/presentation/features/admin/screens/add_course_screen.dart';
import 'package:student_app/presentation/features/admin/screens/analytics_screen.dart';
import 'package:student_app/presentation/features/admin/screens/courses_screen.dart';
import 'package:student_app/presentation/features/admin/screens/orders_screen.dart';

class AdminScreen extends StatefulWidget {
  static const routeName = '/admin';
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    const CoursesScreen(),
    const AnalyticsScreen(),
    const OrdersScreen(),
  ];
  List<BottomNavigationBarItem> barItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'الرئيسية',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.analytics_outlined),
      label: 'الإحصائيات',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.all_inbox_outlined),
      label: 'الطلبات',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: pages[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          tooltip: 'إضافة دورة جديدة',
          onPressed: () =>
              Navigator.pushNamed(context, AddCourseScreen.routeName),
          child: const Icon(
            Icons.add,
            size: 28.0,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: barItems,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
