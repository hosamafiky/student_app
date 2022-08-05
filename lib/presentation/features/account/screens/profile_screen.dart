import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/data.dart';
import 'package:student_app/data/models/country_model.dart';
import 'package:student_app/presentation/features/account/screens/change_pass_screen.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';
import 'package:student_app/presentation/widgets/phone_formfield.dart';
import 'package:student_app/providers/user_provider.dart';

enum Languages { english, arabic }

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  Country _selectedCountry = countries[0];
  int countryDialCode = 966;
  var selectedLanguage = Languages.arabic;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      backgroundColor: Palette.kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'الملف الشخصي',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: SizeConfig.getProportionalWidth(context, 80.0),
                          height:
                              SizeConfig.getProportionalWidth(context, 80.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(user.profileImage),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 15.0,
                                color: const Color(0xFF60A4AD).withAlpha(15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 14.0),
                    ),
                    Form(
                      key: _formKey,
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
                            height:
                                SizeConfig.getProportionalHeight(context, 8),
                          ),
                          DefaultTextFormField(
                            hintText: 'إسم الحساب',
                            controller: nameController,
                          ),
                          SizedBox(
                            height:
                                SizeConfig.getProportionalHeight(context, 18.0),
                          ),
                          const Text(
                            'البريد الإلكتروني',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height:
                                SizeConfig.getProportionalHeight(context, 8),
                          ),
                          DefaultTextFormField(
                            hintText: 'أدخل البريد الإلكتروني',
                            controller: emailController,
                          ),
                          SizedBox(
                            height:
                                SizeConfig.getProportionalHeight(context, 18.0),
                          ),
                          const Text(
                            'رقم الجوال',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height:
                                SizeConfig.getProportionalHeight(context, 8),
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
                            height:
                                SizeConfig.getProportionalHeight(context, 16.0),
                          ),
                          const Text(
                            'اللغة',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height:
                                SizeConfig.getProportionalHeight(context, 8),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Palette.kGreyColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          'العربية',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Radio(
                                        activeColor: Palette.kPrimaryColor,
                                        value: Languages.arabic,
                                        groupValue: selectedLanguage,
                                        onChanged: (Languages? language) {
                                          setState(() {
                                            selectedLanguage = language!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.getProportionalWidth(
                                    context, 15.0),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Palette.kGreyColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          'الإنجليزية',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Radio(
                                        activeColor: Palette.kPrimaryColor,
                                        value: Languages.english,
                                        groupValue: selectedLanguage,
                                        onChanged: (Languages? language) {
                                          setState(() {
                                            selectedLanguage = language!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                SizeConfig.getProportionalHeight(context, 20.0),
                          ),
                          DefaultButton(
                            onTap: () {},
                            text: 'تعديل',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 8),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, ChangePasswordScreen.routeName),
                      child: const Text('تغيير كلمة المرور'),
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
