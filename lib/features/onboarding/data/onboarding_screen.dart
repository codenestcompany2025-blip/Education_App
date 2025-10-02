import 'package:eduaction_app/features/onboarding/data/screen/FirstScreen.dart';
import 'package:eduaction_app/features/onboarding/data/screen/SecondScreen.dart';
import 'package:eduaction_app/features/onboarding/data/screen/ThirdScreen.dart';
import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ===== PageView =====
          Flexible(
            child: PageView(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  index = value; // تحديث رقم الصفحة
                });
              },
              children: [
                Center(child: FirstScreen()),
                Center(child: Secondscreen()),
                Center(child: Thirdscreen()),
              ],
            ),
          ),

          // // ===== Indicators =====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIndicator(active: index == 0),
              const SizedBox(width: 8),
              CustomIndicator(active: index == 1),
              const SizedBox(width: 8),
              CustomIndicator(active: index == 2),
            ],
          ),

          const SizedBox(height: 30),

          // // ===== زر الانتقال =====
          CustomButton(
            text: 'التالي',
            color: whiteColor,
            backgr: blueColor,
            width: 160,
            borderRadius: 4,
            onPressed: () {
              if (index < 2) {
                _controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
              if (index == 2) {
                Navigator.pushReplacementNamed(context, '/AfterOnBoarding');
              }
            },
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final bool active;

  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? blueColor : grayColor,
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}
