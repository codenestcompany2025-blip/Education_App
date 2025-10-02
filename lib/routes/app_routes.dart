import 'package:eduaction_app/features/auth/screens/signup.dart';
import 'package:eduaction_app/features/onboarding/data/screen/SecondScreen.dart';
import 'package:eduaction_app/features/onboarding/data/screen/ThirdScreen.dart';
import 'package:flutter/material.dart';

import '../features/auth/screens/afteronboarding.dart';
import '../features/auth/screens/login.dart';
import '../features/onboarding/data/onboarding_screen.dart';
import '../features/onboarding/data/screen/FirstScreen.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String firstScreen = '/FirstScreen';
  static const String secondScreen = '/Secondscreen';
  static const String thirdScreen = '/Thirdscreen';
  static const String afterOnBoarding = '/AfterOnBoarding';
  static const String login='/login';
  static const String signup='/signup';
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
      case login:
        return MaterialPageRoute(builder: (_)=>const Login());
      case signup:
        return MaterialPageRoute(builder: (_)=>const Signup());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('صفحة غير موجودة'))),
        );
    }
  }
}
