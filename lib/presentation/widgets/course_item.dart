import 'package:flutter/material.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/course_details/screens/course_screen.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    Key? key,
    required this.course,
    this.height = double.infinity,
    this.isAdmin = false,
    this.delete,
    this.index,
  }) : super(key: key);

  final Course course;
  final double height;
  final bool? isAdmin;
  final Function()? delete;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => nextPage(context, CourseScreen.routeName, arguments: course),
      child: Container(
        decoration: BoxDecoration(
          color: index != null
              ? index! % 2 == 0
                  ? const Color(0xFFFFF5EB)
                  : const Color(0xFFEFF2FB)
              : const Color(0xFFEFF2FB),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: SizeConfig.getProportionalWidth(context, 134.0),
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    course.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: SizeConfig.getProportionalHeight(context, 89.0),
                  ),
                ),
                if (course.price == 0)
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 4.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFEFF2FB),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Palette.kPrimaryColor,
                            width: 1.0,
                          )),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: Color(0xFFdaa520),
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            'مجاني',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.getProportionalHeight(context, 6.0),
                horizontal: SizeConfig.getProportionalWidth(context, 16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionalWidth(context, 14.0),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 5.0),
                      ),
                      Text(
                        course.studentType,
                        style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionalWidth(context, 12.0),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  if (isAdmin!)
                    GestureDetector(
                      onTap: delete,
                      child: const Icon(
                        Icons.delete_outline,
                        size: 18.0,
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
