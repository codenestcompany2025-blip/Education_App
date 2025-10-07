import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/auth/screens/choosetypelesson.dart';
import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../presentation/widgets/custom_textfield.dart';

class AfterOnBoarding extends StatelessWidget {
  const AfterOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              "assets/images/auth/afterOnBoarding.svg",
              width: 277,
              height: 361.63,
            ),
          ),
          const SizedBox(height: 20),

          const CustomTextField(
            text: 'أطلق العنان لإمكاناتك التعليمية',
            font: 'Cairo-Bold.ttf',
            size: 28,
          ),
          const SizedBox(height: 20),

          const CustomTextField(
            text: 'بوابتك إلى التميز والتوجيه لتحقيق النجاح',
            font: 'Cairo-Black',
            size: 15,
          ),

          const SizedBox(height: 80),

          // 🔹 الأزرار
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // زر تسجيل الدخول
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChooseTypeLessson(
                        isSignIn: true,
                      ),
                    ),
                  );
                },
                backgr: blueColor,
                color: whiteColor,
                width: 140,
                borderRadius: 8,
              ),

              const SizedBox(width: 20),

              // زر تسجيل جديد
              CustomButton(
                text: 'تسجيل جديد',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChooseTypeLessson(
                        isSignIn: false,
                      ),
                    ),
                  );
                },
                backgr: whiteColor,
                color: blueColor,
                width: 120,
                borderRadius: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
