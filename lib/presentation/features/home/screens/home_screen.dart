import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/home/services/home_services.dart';
import 'package:student_app/presentation/features/search/screens/search_screen.dart';
import 'package:student_app/presentation/features/search/services/search_services.dart';
import 'package:student_app/presentation/widgets/course_item.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';
import 'package:student_app/presentation/widgets/drawer_widget.dart';
import 'package:student_app/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  HomeServices homeServices = HomeServices();
  SearchServices searchServices = SearchServices();
  var controller = TextEditingController();
  List<Course> courses = [];
  List<Course> bestCourses = [];

  @override
  void initState() {
    super.initState();
    homeServices.getCourses(context: context).then((value) {
      setState(() {
        for (var element in value) {
          courses.add(Course.fromMap(element));
        }
      });
    });
    homeServices.getBestCourses(context: context).then((value) {
      setState(() {
        for (var element in value) {
          bestCourses.add(Course.fromMap(element));
        }
      });
    });
  }

  void navigateToSearch(String query) {
    if (query.isNotEmpty) {
      searchServices
          .searchForCourse(
        context: context,
        query: query,
      )
          .then((value) {
        Navigator.pushNamed(
          context,
          SearchScreen.routeName,
          arguments: query,
        );
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Palette.kPrimaryColor,
          elevation: 0.0,
          title: const Text(
            'الرئيسية',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.only(
              right: SizeConfig.getProportionalWidth(context, 16.0),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.menu),
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: SizeConfig.getProportionalHeight(context, 120.0),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.getProportionalHeight(context, 32.0),
                horizontal: SizeConfig.getProportionalWidth(context, 16.0),
              ),
              decoration: const BoxDecoration(
                color: Palette.kPrimaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24.0),
                ),
              ),
              child: DefaultTextFormField(
                controller: controller,
                hintText: 'ابحث هنا...',
                suffixIcon: const Icon(Icons.search),
                backgroundColor: Colors.white,
                onFieldSubmitted: navigateToSearch,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 14.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical:
                            SizeConfig.getProportionalHeight(context, 8.0),
                        horizontal:
                            SizeConfig.getProportionalWidth(context, 16.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الدورات',
                            style: TextStyle(
                              fontSize: SizeConfig.getProportionalWidth(
                                  context, 12.0),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                //  Go to my courses page
                              },
                              child: Text(
                                'المزيد',
                                style: TextStyle(
                                  fontSize: SizeConfig.getProportionalWidth(
                                      context, 12.0),
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 160.0),
                      width: double.infinity,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              SizeConfig.getProportionalWidth(context, 16.0),
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var course = courses[index];
                          return CourseItem(course: course);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                            width:
                                SizeConfig.getProportionalWidth(context, 16.0)),
                        itemCount: courses.length,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical:
                            SizeConfig.getProportionalHeight(context, 16.0),
                        horizontal:
                            SizeConfig.getProportionalWidth(context, 16.0),
                      ),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'الدورات الأعلى تقييما',
                        style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionalWidth(context, 12.0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 160.0),
                      width: double.infinity,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              SizeConfig.getProportionalWidth(context, 16.0),
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var course = bestCourses[index];
                          return CourseItem(course: course);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                            width:
                                SizeConfig.getProportionalWidth(context, 16.0)),
                        itemCount: bestCourses.length,
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
