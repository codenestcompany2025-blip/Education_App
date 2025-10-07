import 'package:eduaction_app/features/auth/screens/signup.dart';
import 'package:eduaction_app/features/onboarding/data/screen/SecondScreen.dart';
import 'package:eduaction_app/features/onboarding/data/screen/ThirdScreen.dart';
import 'package:eduaction_app/features/presentation/screens/choosespecialization.dart';
import 'package:flutter/material.dart';

import '../features/auth/screens/afteronboarding.dart';
import '../features/auth/screens/forgetpassword.dart';
import '../features/auth/screens/resetpassword.dart';
import '../features/auth/screens/signinscreen.dart';
import '../features/auth/screens/verifycode.dart';
import '../features/onboarding/data/onboarding_screen.dart';
import '../features/onboarding/data/screen/FirstScreen.dart';

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
        return MaterialPageRoute(builder: (_)=>const ResetPassword());
      case chooseSpecialization:
        return MaterialPageRoute(builder: (_)=>const Choosespecialization());
      case login:
        final userType =
            settings.arguments as String?; // استقبل النوع من الـ arguments
        return MaterialPageRoute(
          builder: (_) => SignInScreen(userType: userType ?? 'tawjehi'),
        );

      case signup:
        final userType =
            settings.arguments as String?; // استقبل النوع من الـ arguments
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(userType: userType ?? 'tawjehi'),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('صفحة غير موجودة'))),
        );
    }
  }
}
