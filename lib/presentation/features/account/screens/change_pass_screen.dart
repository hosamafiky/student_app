import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = '/ChangePassword';
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'تغيير كلمة المرور',
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
              left: SizeConfig.getProportionalWidth(context, 16.0)),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: SizeConfig.getProportionalHeight(context, 40.0),
            ),
            Container(
              width: double.infinity,
              height: SizeConfig.getProportionalHeight(context, 676.0),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionalWidth(context, 16.0),
                vertical: SizeConfig.getProportionalHeight(context, 25.0),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
                color: Color(0xFFFEFEFF),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 20.0),
                    ),
                    const Text(
                      'كلمة المرور الحالية',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 8),
                    ),
                    DefaultTextFormField(
                      hintText: 'أدخل كلمة المرور الحالية',
                      controller: currentPasswordController,
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 18.0),
                    ),
                    const Text(
                      'كلمة المرور الجديدة',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 8),
                    ),
                    DefaultTextFormField(
                      hintText: 'أدخل كلمة المرور الجديدة',
                      controller: currentPasswordController,
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 18.0),
                    ),
                    const Text(
                      'تأكيد كلمة المرور الجديدة',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 8),
                    ),
                    DefaultTextFormField(
                      hintText: 'أدخل تأكيد كلمة المرور الجديدة',
                      controller: newPasswordConfirmController,
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 40.0),
                    ),
                    DefaultButton(
                      onTap: () => Navigator.pop(context),
                      text: 'تعديل',
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
