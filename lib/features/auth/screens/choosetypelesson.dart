import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseTypeLessson extends StatelessWidget {
  const ChooseTypeLessson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/auth/tawjehe.png",
            width: 190,
            height: 225,
          ),
        ],
      ),
    );
  }
}
