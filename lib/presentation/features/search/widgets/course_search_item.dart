import 'package:flutter/material.dart';
import 'package:student_app/data/models/course_model.dart';

class CourseSearchItem extends StatelessWidget {
  const CourseSearchItem(this.course, {Key? key}) : super(key: key);

  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black12,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              course.image,
              height: 100.0,
              width: 130.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              height: 100.0,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'تقييم الدورة: ',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        double.parse(course.courseRate.toString()).toString(),
                        style: const TextStyle(fontSize: 12.0),
                      ),
                      const Spacer(),
                      const Text(
                        'تقييم المدرس: ',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        double.parse(course.instructorRate.toString())
                            .toString(),
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/person_icon.png',
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        course.studentType,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                      const Spacer(),
                      Image.asset('assets/images/calendar_icon.png'),
                      const SizedBox(width: 5.0),
                      Text(
                        course.appointments.join(", "),
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
