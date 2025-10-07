import 'package:eduaction_app/features/auth/screens/signinscreen.dart';
import 'package:eduaction_app/features/auth/screens/signup.dart';
import 'package:flutter/material.dart';

class ChooseTypeLessson extends StatelessWidget {
  final bool isSignIn; // 🔹 نعرف هل المستخدم بدو يسجل دخول أو جديد

  const ChooseTypeLessson({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 خيار توجيهي
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => isSignIn
                        ? SignInScreen(userType: 'tawjehi')
                        : SignUpScreen(userType: 'tawjehi'),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/auth/twjehe.png",
                width: 190,
                height: 225,
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 خيار كورسات
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => isSignIn
                        ? SignInScreen(userType: 'courses')
                        : SignUpScreen(userType: 'courses'),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/auth/courses.png",
                width: 190,
                height: 225,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
