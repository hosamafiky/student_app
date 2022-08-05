import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/data.dart';
import 'package:student_app/data/models/country_model.dart';
import 'package:student_app/presentation/features/auth/screens/forgot_password_screen.dart';
import 'package:student_app/presentation/features/auth/screens/register_screen.dart';
import 'package:student_app/presentation/features/auth/services/auth.dart';
import 'package:student_app/presentation/features/home/screens/home_screen.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';
import 'package:student_app/presentation/widgets/phone_formfield.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
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
                  'تسجيل دخول',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.getProportionalHeight(context, 70.0),
              ),
              Container(
                width: double.infinity,
                height: SizeConfig.getProportionalHeight(context, 627.0),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionalWidth(context, 16),
                  vertical: SizeConfig.getProportionalHeight(context, 14),
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        controller: phoneController,
                        initialValue: _selectedCountry,
                        countries: countries,
                        onChanged: (value) {
                          setState(() {
                            _selectedCountry = value!;
                            countryDialCode = _selectedCountry.dialCode;
                          });
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 18.0),
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
                        height: SizeConfig.getProportionalHeight(context, 5.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              ForgotPasswordScreen.routeName,
                            ),
                            child: const Text(
                              'نسيت كلمة المرور؟',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 39.0),
                      ),
                      DefaultButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            AuthServices().userLogin(
                              context,
                              phone: countryDialCode.toString() +
                                  phoneController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        text: 'تسجيل دخول',
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionalHeight(context, 39.0),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, HomeScreen.routeName),
                          child: const Text(
                            'تخطي',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'لا أملك حساب',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, RegisterScreen.routeName),
                            child: const Text(
                              'تسجيل جديد',
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
            ],
          ),
        ),
      ),
    );
  }
}
