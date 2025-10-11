import 'package:eduaction_app/features/auth/screens/signup.dart';
import 'package:eduaction_app/features/onboarding/data/screen/SecondScreen.dart';
import 'package:eduaction_app/features/onboarding/data/screen/ThirdScreen.dart';
import 'package:eduaction_app/features/presentation/screens/choosespecialization.dart';
import 'package:eduaction_app/features/presentation/screens/detailesofteacher.dart';
import 'package:eduaction_app/features/presentation/screens/homepage.dart';
import 'package:eduaction_app/features/presentation/screens/modulespage.dart';
import 'package:flutter/material.dart';

import '../features/auth/screens/afteronboarding.dart';
import '../features/auth/screens/forgetpassword.dart';
import '../features/auth/screens/resetpassword.dart';
import '../features/auth/screens/signinscreen.dart';
import '../features/auth/screens/verifycode.dart';
import '../features/onboarding/data/onboarding_screen.dart';
import '../features/onboarding/data/screen/FirstScreen.dart';
import '../features/presentation/screens/sections.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String firstScreen = '/FirstScreen';
  static const String secondScreen = '/Secondscreen';
  static const String thirdScreen = '/Thirdscreen';
  static const String afterOnBoarding = '/AfterOnBoarding';
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

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case firstScreen:
        return MaterialPageRoute(builder: (_) => const FirstScreen());

      case secondScreen:
        return MaterialPageRoute(builder: (_) => const Secondscreen());

      case thirdScreen:
        return MaterialPageRoute(builder: (_) => const Thirdscreen());

      case afterOnBoarding:
        return MaterialPageRoute(builder: (_) => const AfterOnBoarding());

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
        final imagePath = args['imagePath'] ?? '';

        return MaterialPageRoute(
          builder: (_) => Detailesofteacher(
            name: name,
            imagePath: imagePath,
          ),
        );

      case modulesPage:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        final teacherName = args['name'] ?? '';
        final imagePath = args['image'] ?? '';

        return MaterialPageRoute(
          builder: (_) => ModulesPage(
            teacherName: teacherName,
            imagePath: imagePath,
          ),
        );

      case login:
        final userType = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => SignInScreen(userType: userType ?? 'tawjehi'),
        );

      case signup:
        final userType = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(userType: userType ?? 'tawjehi'),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('صفحة غير موجودة')),
          ),
        );
    }
  }
}
