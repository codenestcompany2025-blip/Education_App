import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: SvgPicture.asset(
                  "assets/images/onboarding/firstscreeen.svg",
                  width: 320.55,
                  height: 209.09,
                ),
              ),
              CustomTextField(text: 'اختر معلمك', font: 'Cairo-Bold', size: 28),
              CustomTextField(
                text: ' ! كل مادة يشرحها اكثر من معلم,وانت تختار  ',
                font: 'Cairo-Black',
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
