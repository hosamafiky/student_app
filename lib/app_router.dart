import 'package:flutter/material.dart';
import 'package:student_app/data/models/course_model.dart';
import 'package:student_app/presentation/features/account/screens/change_pass_screen.dart';
import 'package:student_app/presentation/features/account/screens/courses_screen.dart';
import 'package:student_app/presentation/features/account/screens/notifications_screen.dart';
import 'package:student_app/presentation/features/account/screens/profile_screen.dart';
import 'package:student_app/presentation/features/admin/screens/admin_screen.dart';
import 'package:student_app/presentation/features/admin/screens/add_course_screen.dart';
import 'package:student_app/presentation/features/auth/screens/login_screen.dart';
import 'package:student_app/presentation/features/auth/screens/register_screen.dart';
import 'package:student_app/presentation/features/course_details/screens/course_screen.dart';
import 'package:student_app/presentation/features/home/screens/home_screen.dart';
import 'package:student_app/presentation/features/search/screens/search_screen.dart';
import 'package:student_app/presentation/screens/screens.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case RegisterScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterScreen(),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case CourseScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CourseScreen(course: settings.arguments as Course),
        );
      case EnrollSuccessScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EnrollSuccessScreen(),
        );
      case PaymentMethodsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PaymentMethodsScreen(),
        );
      case PaymentDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PaymentDetailsScreen(),
        );
      case TransferScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TransferScreen(),
        );
      case TransferSuccessScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TransferSuccessScreen(),
        );
      case AdminScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AdminScreen(),
        );
      case AddCourseScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddCourseScreen(),
        );
      case SearchScreen.routeName:
        var query = settings.arguments as String;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SearchScreen(query),
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProfileScreen(),
        );
      case ChangePasswordScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChangePasswordScreen(),
        );
      case NotificationsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NotificationsScreen(),
        );
      case CoursesScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CoursesScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name} '),
            ),
          ),
        );
    }
  }
}
