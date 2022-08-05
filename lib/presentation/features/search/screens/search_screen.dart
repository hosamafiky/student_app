import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/search/widgets/course_search_item.dart';
import 'package:student_app/presentation/features/search/services/search_services.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';
import 'package:student_app/presentation/widgets/drawer_widget.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  const SearchScreen(this.query, {Key? key}) : super(key: key);
  final String query;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  SearchServices searchServices = SearchServices();
  List<Course> courses = [];
  String? queryText;

  @override
  void initState() {
    super.initState();
    fetchSearchData(widget.query);
  }

  void fetchSearchData(String query) {
    courses = [];
    queryText = query;
    if (query.isNotEmpty) {
      searchServices
          .searchForCourse(
        context: context,
        query: query,
      )
          .then((value) {
        for (var element in value) {
          setState(() {
            courses.add(Course.fromMap(element));
          });
        }
      });
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Palette.kPrimaryColor,
          elevation: 0.0,
          title: const Text(
            'نتيجة البحث',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ],
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
                hintText: 'ابحث هنا...',
                suffixIcon: const Icon(Icons.search),
                backgroundColor: Colors.white,
                onFieldSubmitted: fetchSearchData,
              ),
            ),
            SizedBox(
              height: SizeConfig.getProportionalHeight(context, 14.0),
            ),
            Expanded(
              child: courses.isNotEmpty
                  ? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var course = courses[index];
                        return CourseSearchItem(course);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10.0),
                      itemCount: courses.length,
                    )
                  : Center(
                      child: Text(
                        'لا توجد نتائج مطابقة لبحثك : ($queryText)',
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
