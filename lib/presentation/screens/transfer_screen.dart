import 'package:flutter/material.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/screens/screens.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';

class TransferScreen extends StatefulWidget {
  static const String routeName = '/transfer';
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int chosenIndex = 0;
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
              'إيصال التحويل',
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 24.0),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height:
                            SizeConfig.getProportionalHeight(context, 180.0),
                        child: Image.asset('assets/images/credit_card.png'),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 39.7),
                      ),
                      const Text(
                        'اسم البنك',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 8),
                      ),
                      const DefaultTextFormField(
                        hintText: 'أدخل إسم البنك',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 22.0),
                      ),
                      const Text(
                        'رقم الحساب',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 8),
                      ),
                      const DefaultTextFormField(
                        hintText: 'أدخل رقم الحساب',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 22.0),
                      ),
                      const Text(
                        'رقم الأيبان',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 8),
                      ),
                      const DefaultTextFormField(
                        hintText: 'أدخل رقم الأيبان',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 8),
                      ),
                      const Text(
                        'قم بإرفاق إيصال الدفع',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 16),
                      ),
                      Container(
                        width: double.infinity,
                        height:
                            SizeConfig.getProportionalHeight(context, 152.0),
                        decoration: BoxDecoration(
                          color: Palette.kGreyColor,
                          borderRadius: BorderRadius.circular(
                            SizeConfig.getProportionalWidth(context, 8.0),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/upload.png'),
                              SizedBox(
                                height: SizeConfig.getProportionalHeight(
                                    context, 7.0),
                              ),
                              const Text(
                                'إضغط هنا لإرفاق إيصال الدفع',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 40.0),
                      ),
                      DefaultButton(
                        onTap: () =>
                            nextPage(context, TransferSuccessScreen.routeName),
                        text: 'إرسال',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
