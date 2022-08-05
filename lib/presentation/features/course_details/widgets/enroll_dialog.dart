import 'package:flutter/material.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/course_details/services/course_services.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class EnrollDialog extends StatelessWidget {
  final Course course;
  final CourseServices services;
  const EnrollDialog(
    this.course, {
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.getProportionalWidth(context, 16.0),
        ),
      ),
      title: Column(
        children: [
          Image.asset('assets/images/enroll.png'),
          SizedBox(
            height: SizeConfig.getProportionalHeight(context, 15.0),
          ),
          Text(
            'هل تريد التسجيل المجاني بالدورة؟',
            style: TextStyle(
              fontSize: SizeConfig.getProportionalWidth(context, 12.0),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actionsPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getProportionalWidth(context, 14.0),
        vertical: SizeConfig.getProportionalHeight(context, 20.0),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: DefaultButton(
                onTap: () => Navigator.pop(context),
                text: 'لا',
                notSelected: true,
              ),
            ),
            SizedBox(
              width: SizeConfig.getProportionalWidth(context, 15.5),
            ),
            Expanded(
              child: DefaultButton(
                onTap: () => services.enroll(
                  context: context,
                  course: course,
                ),
                text: 'نعم',
              ),
            ),
          ],
        )
      ],
    );
  }
}
