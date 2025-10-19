import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/auth/choose_type_lesson/screens/choose_type_lesson.dart';
import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../presentation/widgets/custom_textfield.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(child: SvgPicture.asset("assets/images/auth/afterOnBoarding.svg", width: 277, height: 361.63)),
            SizedBox(height: 30),
            customTextField(text: 'أطلق العنان لإمكاناتك التعليمية', size: 20, weight: FontWeight.w800),
            SizedBox(height: 10),
            customTextField(text: 'بوابتك إلى التميز والتوجيه لتحقيق النجاح', size: 16, weight: FontWeight.w400),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Flexible(
                  child: AppButtons.primaryButton(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChooseTypeLessson(isSignIn: true)),
                      );
                    },
                    background: AppColors.blueColor,
                    color: AppColors.whiteColor,
                    borderRadius: 8,
                  ),
                ),
                Flexible(
                  child: AppButtons.outlinedButton(
                    text: 'تسجيل جديد',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChooseTypeLessson(isSignIn: false)),
                      );
                    },
                    color: AppColors.blueColor,
                    borderRadius: 8,
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    ),
  );
}
