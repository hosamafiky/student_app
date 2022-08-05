import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/data.dart';
import 'package:student_app/data/models/country_model.dart';
import 'package:student_app/presentation/features/auth/services/auth.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';
import 'package:student_app/presentation/widgets/phone_formfield.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authServices = AuthServices();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  Country _selectedCountry = countries[0];
  int countryDialCode = 966;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: SizeConfig.getProportionalHeight(context, 88),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  'تسجيل جديد',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.getProportionalHeight(context, 46.0),
              ),
              Container(
                width: double.infinity,
                height: SizeConfig.getProportionalHeight(context, 651.0),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionalWidth(context, 16),
                ).copyWith(
                  top: SizeConfig.getProportionalHeight(context, 29),
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'الإسم',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.getProportionalHeight(context, 8),
                        ),
                        DefaultTextFormField(
                          hintText: 'الإسم الأول',
                          controller: nameController,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height:
                              SizeConfig.getProportionalHeight(context, 22.0),
                        ),
                        const Text(
                          'البريد الإلكتروني',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.getProportionalHeight(context, 8),
                        ),
                        DefaultTextFormField(
                          hintText: 'أدخل بريدك الإلكتروني',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height:
                              SizeConfig.getProportionalHeight(context, 22.0),
                        ),
                        const Text(
                          'رقم الجوال',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.getProportionalHeight(context, 8),
                        ),
                        PhoneFormField(
                          initialValue: _selectedCountry,
                          countries: countries,
                          controller: phoneController,
                          onChanged: (value) {
                            setState(() {
                              _selectedCountry = value!;
                              countryDialCode = _selectedCountry.dialCode;
                            });
                          },
                        ),
                        SizedBox(
                          height:
                              SizeConfig.getProportionalHeight(context, 22.0),
                        ),
                        const Text(
                          'كلمة المرور',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.getProportionalHeight(context, 8),
                        ),
                        DefaultTextFormField(
                          hintText: 'أدخل كلمة المرور',
                          obsecureText: true,
                          controller: passwordController,
                        ),
                        SizedBox(
                          height:
                              SizeConfig.getProportionalHeight(context, 22.0),
                        ),
                        const Text(
                          'تأكيد كلمة المرور',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.getProportionalHeight(context, 8),
                        ),
                        DefaultTextFormField(
                          hintText: 'أدخل تأكيد كلمة المرور',
                          obsecureText: true,
                          controller: confirmPasswordController,
                        ),
                        SizedBox(
                          height:
                              SizeConfig.getProportionalHeight(context, 16.0),
                        ),
                        DefaultButton(
                          text: 'تسجيل جديد',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              authServices.userRegister(
                                context,
                                name: nameController.text,
                                email: emailController.text,
                                phone: countryDialCode.toString() +
                                    phoneController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                              );
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'لدي حساب بالفعل؟',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/login'),
                              child: const Text(
                                'تسجيل دخول',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF80FF72),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
