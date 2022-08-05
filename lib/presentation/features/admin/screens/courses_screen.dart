import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/admin/services/admin_services.dart';
import 'package:student_app/presentation/features/auth/screens/login_screen.dart';
import 'package:student_app/presentation/widgets/course_item.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  List<Course> data = [];
  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  void fetchCourses() {
    AdminServices().getCourses(context: context).then((value) {
      setState(() {
        for (var element in value) {
          data.add(Course.fromMap(element));
        }
      });
    });
  }

  final AdminServices _adminServices = AdminServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'الدورات المتاحة',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.logout_outlined),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('x-auth-token', '').then((value) {
              nextPage(context, LoginScreen.routeName);
            });
          },
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
              child: data.isNotEmpty
                  ? GridView.builder(
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing:
                            SizeConfig.getProportionalWidth(context, 16.0),
                        mainAxisSpacing:
                            SizeConfig.getProportionalHeight(context, 16.0),
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) => CourseItem(
                        isAdmin: true,
                        course: data[index],
                        height: SizeConfig.getProportionalHeight(context, 50.0),
                        delete: () {
                          _adminServices.deleteCourse(
                            context: context,
                            id: data[index].id,
                          );
                          data.removeAt(index);
                        },
                      ),
                    )
                  : const Center(
                      child: Text(
                        'لا يوجد دورات متاحة',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
