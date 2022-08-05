import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'إستعادة كلمة المرور',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.getProportionalWidth(context, 16.0)),
            child: Container(
              width: SizeConfig.getProportionalWidth(context, 35.0),
              height: SizeConfig.getProportionalHeight(context, 35.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: SizeConfig.getProportionalHeight(context, 40.0),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionalWidth(context, 16.0),
                  vertical: SizeConfig.getProportionalHeight(context, 40.0),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      width: SizeConfig.getProportionalWidth(context, 125.0),
                      height: SizeConfig.getProportionalHeight(context, 125.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.kPrimaryColor.withOpacity(0.1),
                      ),
                      child: Image.asset(
                        'assets/images/passchange.png',
                        width: SizeConfig.getProportionalWidth(context, 243.03),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 38.0),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'كلمة المرور الجديدة',
                        style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionalWidth(context, 12.0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 8.0),
                    ),
                    const DefaultTextFormField(
                      hintText: 'كلمة المرور الجديدة',
                      obsecureText: true,
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 23.0),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'تأكيد كلمة المرور الجديدة',
                        style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionalWidth(context, 12.0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 8.0),
                    ),
                    const DefaultTextFormField(
                      hintText: 'تأكيد كلمة المرور الجديدة',
                      obsecureText: true,
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 40.0),
                    ),
                    DefaultButton(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      text: 'التالي',
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
