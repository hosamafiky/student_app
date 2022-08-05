import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/home/services/home_services.dart';
import 'package:student_app/presentation/widgets/course_item.dart';

class CoursesScreen extends StatefulWidget {
  static const String routeName = '/Courses';
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  List<Course> courses = [];
  @override
  void initState() {
    super.initState();
    HomeServices().getCourses(context: context).then((value) {
      for (var course in value) {
        setState(() {
          courses.add(Course.fromMap(course));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'الدورات',
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
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
                color: Color(0xFFFEFEFF),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: courses.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                          ),
                          itemBuilder: (context, index) {
                            var course = courses[index];
                            return CourseItem(
                              course: course,
                              index: index,
                            );
                          },
                          itemCount: courses.length,
                        ),
                      )
                    : const Center(child: Text('لا توجد دورات حالياً')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
