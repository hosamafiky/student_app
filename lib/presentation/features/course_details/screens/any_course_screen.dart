import 'package:flutter/material.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/course_details/services/course_services.dart';
import 'package:student_app/presentation/features/course_details/widgets/enroll_dialog.dart';
import 'package:student_app/presentation/features/course_details/widgets/rate_widget.dart';
import 'package:student_app/presentation/screens/screens.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class AnyCourse extends StatelessWidget {
  const AnyCourse(
    this.course, {
    Key? key,
    required this.courseRate,
    required this.instructorRate,
    required this.services,
  }) : super(key: key);
  final Course course;
  final double courseRate;
  final double instructorRate;
  final CourseServices services;

  @override
  Widget build(BuildContext context) {
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
          ]),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height:
                            SizeConfig.getProportionalHeight(context, 173.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(course.image),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(
                              SizeConfig.getProportionalWidth(context, 8.0)),
                        ),
                      ),
                      Positioned(
                        top: SizeConfig.getProportionalHeight(context, 10.0),
                        right: SizeConfig.getProportionalWidth(context, 12.0),
                        child: RateWidget(
                          context,
                          rate: courseRate,
                          text: 'تقييم الدورة',
                        ),
                      ),
                      Positioned(
                        top: SizeConfig.getProportionalHeight(context, 10.0),
                        left: SizeConfig.getProportionalWidth(context, 12.0),
                        child: RateWidget(
                          context,
                          rate: instructorRate,
                          text: 'تقييم المدرس',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 14.0),
                  ),
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage('assets/images/title_icon.png'),
                      ),
                      SizedBox(
                        width: SizeConfig.getProportionalWidth(context, 4.0),
                      ),
                      Text(
                        course.name,
                        style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionalWidth(context, 14.0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 15.0),
                  ),
                  Text(
                    course.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: SizeConfig.getProportionalWidth(context, 10.0),
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 22.0),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage('assets/images/person_icon.png'),
                          ),
                          Text(
                            course.studentType,
                            style: TextStyle(
                              fontSize: SizeConfig.getProportionalWidth(
                                  context, 10.0),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: SizeConfig.getProportionalWidth(context, 45.5),
                      ),
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage('assets/images/calendar_icon.png'),
                          ),
                          Text(
                            course.appointments.join(', '),
                            style: TextStyle(
                              fontSize: SizeConfig.getProportionalWidth(
                                  context, 10.0),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 23.0),
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
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 22.0),
                  ),
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage('assets/images/money_icon.png'),
                      ),
                      Text(
                        'سعر الدورة : ${course.price == 0 ? 'مجانا' : '${course.price.round()} ريال'}',
                        style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionalWidth(context, 14.0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.getProportionalHeight(context, 40.0),
                  ),
                  DefaultButton(
                    onTap: () {
                      if (course.price == 0) {
                        showDialog(
                          context: context,
                          builder: (context) => EnrollDialog(
                            course,
                            services: services,
                          ),
                        );
                      } else {
                        nextPage(
                          context,
                          PaymentMethodsScreen.routeName,
                        );
                      }
                    },
                    text: 'التسجيل بالدورة',
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
