import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class ForgotVerficationScreen extends StatefulWidget {
  const ForgotVerficationScreen({Key? key}) : super(key: key);

  @override
  State<ForgotVerficationScreen> createState() =>
      _ForgotVerficationScreenState();
}

class _ForgotVerficationScreenState extends State<ForgotVerficationScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'كود التحقق',
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
                        'assets/images/lock.png',
                        width: SizeConfig.getProportionalWidth(context, 243.03),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 38.0),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'كود التحقق',
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
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _CodeField(onSaved: (pin1) {}),
                            _CodeField(onSaved: (pin2) {}),
                            _CodeField(onSaved: (pin3) {}),
                            _CodeField(onSaved: (pin4) {}),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 40.0),
                    ),
                    DefaultButton(
                      onTap: () =>
                          Navigator.pushNamed(context, '/change_password'),
                      text: 'التالي',
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 40.0),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      child: const Text(
                        'تسجيل دخول',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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

class _CodeField extends StatelessWidget {
  const _CodeField({
    Key? key,
    required this.onSaved,
  }) : super(key: key);

  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.kGreyColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: SizeConfig.getProportionalWidth(context, 48.0),
      height: SizeConfig.getProportionalWidth(context, 48.0),
      child: Center(
        child: TextFormField(
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
              ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).previousFocus();
            }
          },
          onSaved: onSaved,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '0',
          ),
        ),
      ),
    );
  }
}
