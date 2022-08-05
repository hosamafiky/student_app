import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/data.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class StudentLevelScreen extends StatefulWidget {
  const StudentLevelScreen({Key? key}) : super(key: key);

  @override
  State<StudentLevelScreen> createState() => _StudentLevelScreenState();
}

class _StudentLevelScreenState extends State<StudentLevelScreen> {
  var _selectedLevel = Levels.intern;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'مستوى الطالب',
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
                  vertical: SizeConfig.getProportionalHeight(context, 20.0),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 60.2),
                    ),
                    Image.asset(
                      'assets/images/student_level.png',
                      width: SizeConfig.getProportionalWidth(context, 243.03),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 32.8),
                    ),
                    Text(
                      'من فضلك اختر مستوى الطالب',
                      style: TextStyle(
                        fontSize:
                            SizeConfig.getProportionalWidth(context, 18.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 100.0),
                    ),
                    DefaultButton(
                      onTap: () {
                        setState(() {
                          _selectedLevel = Levels.intern;
                        });
                        Navigator.pushNamed(context, '/verfication');
                      },
                      text: 'طبيب إمتياز',
                      notSelected: _selectedLevel != Levels.intern,
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 24.5),
                    ),
                    DefaultButton(
                      onTap: () {
                        setState(() {
                          _selectedLevel = Levels.resident;
                        });
                        Navigator.pushNamed(context, '/verfication');
                      },
                      text: 'طالب مقيم',
                      notSelected: _selectedLevel != Levels.resident,
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 24.5),
                    ),
                    DefaultButton(
                      onTap: () {
                        setState(() {
                          _selectedLevel = Levels.other;
                        });
                        Navigator.pushNamed(context, '/verfication');
                      },
                      text: 'مستوى آخر',
                      notSelected: _selectedLevel != Levels.other,
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
