import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/course_details/screens/any_course_screen.dart';
import 'package:student_app/presentation/features/course_details/services/course_services.dart';
import 'package:student_app/presentation/features/course_details/screens/my_course_page.dart';
import 'package:student_app/providers/user_provider.dart';

class CourseScreen extends StatelessWidget {
  static const String routeName = '/course';
  final Course course;
  const CourseScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CourseServices courseServices = CourseServices();
    double avgCourseRate = 0;
    double avgInstructorRate = 0;
    bool isMyCourse = false;
    double totalCourseRate = 0;
    double totalInstructorRate = 0;
    for (int i = 0; i < course.instructorRate!.length; i++) {
      totalInstructorRate += course.instructorRate![i].rating;
    }
    for (int i = 0; i < course.courseRate!.length; i++) {
      totalCourseRate += course.courseRate![i].rating;
    }
    if (totalCourseRate != 0) {
      avgCourseRate = totalCourseRate / course.courseRate!.length;
    }
    if (totalInstructorRate != 0) {
      avgInstructorRate = totalInstructorRate / course.instructorRate!.length;
    }
    final user = context.watch<UserProvider>().user;

    for (int i = 0; i < user.courses!.length; i++) {
      if (user.courses![i].name == course.name) {
        isMyCourse = true;
      }
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: isMyCourse
          ? MyCourse(course)
          : AnyCourse(
              course,
              services: courseServices,
              courseRate: avgCourseRate,
              instructorRate: avgInstructorRate,
            ),
    );
  }
}
