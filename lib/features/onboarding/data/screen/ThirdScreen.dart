import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../presentation/widgets/custom_textfield.dart';

class Thirdscreen extends StatelessWidget {
  const Thirdscreen({super.key});

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
                  "assets/images/onboarding/thirdscreen.svg",
                  width: 320.55,
                  height: 209.09,
                ),
              ),
              CustomTextField(text: 'تواصل مباشر', font: 'Cairo-Bold', size: 28),
              CustomTextField(
                text: 'شات واجتماعات مع المعلم + دعم فني دائم. ',
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
