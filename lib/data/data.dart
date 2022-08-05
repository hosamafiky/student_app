import 'package:student_app/data/models/country_model.dart';

List<Country> countries = [
  Country(dialCode: 966, name: 'Saudi Arabia', flag: 'assets/images/saudi.png'),
  Country(dialCode: 20, name: 'Egypt', flag: 'assets/images/egypt.png'),
  Country(dialCode: 213, name: 'Algeria', flag: 'assets/images/algeria.png'),
  Country(dialCode: 218, name: 'Libya', flag: 'assets/images/libya.png'),
  Country(dialCode: 965, name: 'Kuwait', flag: 'assets/images/kuwait.png'),
];

enum Levels {
  intern,
  resident,
  other,
}

List<String> notifications = [
  'لقد تم إنشاء الدورة بنجاح بخصوص طب الأسنان',
  'يوجد لديك كورس بخصوص كورس النسا والتوليد اليوم الساعة',
  'لقد تم إنشاء الدورة بنجاح بخصوص طب الأسنان',
  'يوجد لديك كورس بخصوص كورس النسا والتوليد اليوم الساعة',
  'لقد تم إنشاء الدورة بنجاح بخصوص طب الأسنان',
  'يوجد لديك كورس بخصوص كورس النسا والتوليد اليوم الساعة',
  'لقد تم إنشاء الدورة بنجاح بخصوص طب الأسنان',
  'يوجد لديك كورس بخصوص كورس النسا والتوليد اليوم الساعة',
];
