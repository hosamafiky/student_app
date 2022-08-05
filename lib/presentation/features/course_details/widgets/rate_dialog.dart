import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/features/course_details/services/course_services.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';

class RateDialog extends StatefulWidget {
  final String id;
  const RateDialog(this.id, {Key? key}) : super(key: key);

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  CourseServices courseServices = CourseServices();
  final commentController = TextEditingController();
  double instructorRate = 0;
  double courseRate = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.getProportionalWidth(context, 16.0),
          ),
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: SizeConfig.getProportionalWidth(context, 327.0),

            child: Column(
              children: [
                Image.asset('assets/images/rate.png'),
                SizedBox(
                  height: SizeConfig.getProportionalHeight(context, 22.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تقييم المدرس',
                      style: TextStyle(
                        fontSize: SizeConfig.getProportionalWidth(context, 12.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: RatingBar.builder(
                        itemSize: 17.0,
                        minRating: 1.0,
                        initialRating: 0.0,
                        unratedColor: Colors.grey,
                        allowHalfRating: true,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Palette.kPrimaryColor,
                        ),
                        itemCount: 5,
                        onRatingUpdate: (rating) {
                          setState(() {
                            instructorRate = rating;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تقييم الدورة',
                      style: TextStyle(
                        fontSize: SizeConfig.getProportionalWidth(context, 12.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: RatingBar.builder(
                        itemSize: 17.0,
                        minRating: 1.0,
                        initialRating: 0.0,
                        allowHalfRating: true,
                        unratedColor: Colors.grey,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Palette.kPrimaryColor,
                        ),
                        itemCount: 5,
                        onRatingUpdate: (rating) {
                          setState(() {
                            courseRate = rating;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 33.0),
                DefaultTextFormField(
                  controller: commentController,
                  hintText: 'اكتب تعليق هنا',
                  maxLines: 7,
                  textColor: Colors.grey,
                ),
                const SizedBox(height: 40.0),
                DefaultButton(
                  onTap: () => courseServices.rate(
                    context: context,
                    id: widget.id,
                    courseRate: courseRate,
                    instructorRate: instructorRate,
                    comment: commentController.text,
                  ),
                  text: 'إرسال',
                  width: 140.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
