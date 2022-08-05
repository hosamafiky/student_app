import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/course_details/services/course_services.dart';
import 'package:student_app/presentation/features/course_details/widgets/rate_dialog.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class MyCourse extends StatelessWidget {
  final Course course;
  const MyCourse(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CourseServices courseServices = CourseServices();

    return Scaffold(
      backgroundColor: Palette.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Palette.kPrimaryColor,
        elevation: 0.0,
        title: const Text(
          'تفاصيل الدورة',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(
              left: SizeConfig.getProportionalWidth(context, 16.0),
              top: SizeConfig.getProportionalHeight(context, 8.0),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.getProportionalHeight(context, 14.0),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                SizeConfig.getProportionalWidth(context, 16.0),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                      SizeConfig.getProportionalWidth(context, 24.0)),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: SizeConfig.getProportionalHeight(context, 173.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(course.image), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(
                          SizeConfig.getProportionalWidth(context, 8.0)),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 16.0),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Palette.kGreyColor,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              course.name,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text('#:${course.id.substring(0, 6)}'),
                          ],
                        ),
                        const SizedBox(height: 13.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'نوع الطالب',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    course.studentType,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              width: 1.0,
                              height: 31.0,
                              color: Colors.grey[400],
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'سعر الدورة',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  const SizedBox(height: 3.0),
                                  Text(
                                    course.price > 0
                                        ? 'ج.مصري ${course.price}'
                                        : 'مجاني',
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              width: 1.0,
                              height: 31.0,
                              color: Colors.grey[400],
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'حالة الطلب',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  SizedBox(height: 3.0),
                                  Text(
                                    'مؤكد',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 22.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/calendar_icon.png'),
                              const SizedBox(width: 8.0),
                              const Text(
                                'مواعيد الدورة',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13.0),
                          Text(
                            course.appointments.join(', '),
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      DefaultButton(
                        width: 70.0,
                        height: 30.0,
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => RateDialog(course.id),
                        ),
                        text: 'تقييم',
                        textStyle: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 24.0),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.getProportionalHeight(context, 20.0),
                      horizontal:
                          SizeConfig.getProportionalWidth(context, 16.0),
                    ),
                    decoration: BoxDecoration(
                      color: Palette.kGreyColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(
                          SizeConfig.getProportionalWidth(context, 16.0)),
                    ),
                    child: Row(
                      children: course.appointments
                          .map(
                            (e) => Expanded(
                              child: Text(
                                e,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: SizeConfig.getProportionalWidth(
                                      context, 14.0),
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      courseServices.exit(context: context, course: course);
                    },
                    child: const Text(
                      'إلغاء الإشتراك',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
