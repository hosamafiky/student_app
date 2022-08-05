import 'package:flutter/material.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/features/home/screens/home_screen.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class TransferSuccessScreen extends StatefulWidget {
  static const String routeName = '/TransferSuccess';
  const TransferSuccessScreen({Key? key}) : super(key: key);

  @override
  State<TransferSuccessScreen> createState() => _TransferSuccessScreenState();
}

class _TransferSuccessScreenState extends State<TransferSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryColor,
        appBar: AppBar(
          backgroundColor: Palette.kPrimaryColor,
          elevation: 0.0,
          title: const Text(
            'تم التحويل',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/enroll_success.png'),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 20.0),
                    ),
                    Text(
                      'لقد تمت عملية التحويل بنجاح',
                      style: TextStyle(
                        fontSize:
                            SizeConfig.getProportionalWidth(context, 18.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 17.0),
                    ),
                    Text(
                      'شكرا لك على طلبك',
                      style: TextStyle(
                        fontSize:
                            SizeConfig.getProportionalWidth(context, 12.0),
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 17.0),
                    ),
                    Text(
                      'سيتم ارسال رابط المجموعة الخاصة بالدورة بعد التأكد من الإيصال',
                      style: TextStyle(
                        fontSize:
                            SizeConfig.getProportionalWidth(context, 12.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 72.0),
                    ),
                    DefaultButton(
                      onTap: () => nextPage(context, HomeScreen.routeName),
                      text: 'دوراتي',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
