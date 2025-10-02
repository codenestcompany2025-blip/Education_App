import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/auth/screens/choosetypelesson.dart';
import 'package:eduaction_app/features/auth/screens/login.dart';
import 'package:eduaction_app/features/auth/screens/signup.dart';
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
          SizedBox(height: 20),

          CustomTextField(
            text: 'أطلق العنان لامكاناتك التعليمية',
            font: 'Cairo-Bold.ttf',
            size: 28,
          ),
          SizedBox(height: 20),

          CustomTextField(
            text: 'بوابتك الى التميز والتوجيه لتحقيق النجاح',
            font: 'Cairo-Black',
            size: 15,
          ),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseTypeLessson()),
                  );
                },
                backgr: blueColor,
                color: whiteColor,
                width: 140,
                borderRadius: 8,
              ),
              SizedBox(width: 20),
              CustomButton(
                text: 'تسجيل جديد',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChooseTypeLessson()));
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
