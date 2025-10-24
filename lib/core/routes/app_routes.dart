import 'package:eduaction_app/features/auth/login_or_register/login_or_register_screen.dart';
import 'package:eduaction_app/features/auth/onboarding/screens/onboarding_screen.dart';
import 'package:eduaction_app/features/auth/register/screens/signup.dart';
import 'package:eduaction_app/features/auth/reset_password/screens/reset_password.dart';
import 'package:eduaction_app/features/presentation/screens/choose_specialization.dart';
import 'package:eduaction_app/features/presentation/screens/details_of_teacher.dart';
import 'package:eduaction_app/features/presentation/screens/home_page.dart';
import 'package:eduaction_app/features/presentation/screens/modules_page.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/screens/signin_screen.dart';
import '../../features/auth/otp/screens/verify_code.dart';
import '../../features/auth/reset_password/screens/forget_password.dart';
import '../../features/presentation/screens/sections.dart';
import '../../features/presentation/screens/unit_content_page.dart';

class AppRoutes {
  static const String onboarding = '/onboardingScreen';
  static const String loginOrRegister = '/loginOrRegister';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forgetPassword';
  static const String verifyCode = '/verifyCode';
  static const String resetPassword = '/resetPassword';
  static const String chooseSpecialization = '/chooseSpecialization';
  static const String homePage = '/homePage';
  static const String sections = '/sections';
  static const String detailsOfTeacher = '/detailsOfTeacher';
  static const String modulesPage = '/modulesPage';
  static const String unitContentPage = '/unitContentPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case loginOrRegister:
        return MaterialPageRoute(builder: (_) => const LoginOrRegisterScreen());

      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());

      case verifyCode:
        return MaterialPageRoute(builder: (_) => const VerifyCode());

      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPassword());

      case chooseSpecialization:
        return MaterialPageRoute(builder: (_) => const Choosespecialization());

      case homePage:
        return MaterialPageRoute(builder: (_) => const Homepage());

      case sections:
        return MaterialPageRoute(builder: (_) => const Sections());

      case detailsOfTeacher:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        final name = args['name'] ?? '';
        final imagePath = args['image'] ?? '';

        return MaterialPageRoute(
          builder: (_) => Detailesofteacher(name: name, imagePath: imagePath),
        );

      case modulesPage:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        final teacherName = args['name'] ?? '';
        final imagePath = args['image'] ?? '';

        return MaterialPageRoute(
          builder: (_) => ModulesPage(teacherName: teacherName, imagePath: imagePath),
        );

      case login:
        final userType = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => SignInScreen(userType: userType ?? 'tawjehi'));

      case signup:
        final userType = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => SignUpScreen(userType: userType ?? 'tawjehi'));
      case unitContentPage:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        final subjectName = args['subjectName'] ?? '';
        final unitName = args['unitName'] ?? '';
        final teacherName = args['teacherName'] ?? '';
        final imagePath = args['imagePath'] ?? '';

        return MaterialPageRoute(
          builder: (_) => UnitContentPage(
            subjectName: subjectName,
            unitName: unitName,
            teacherName: teacherName,
            imagePath: imagePath,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('صفحة غير موجودة'))),
        );
    }
  }
}
