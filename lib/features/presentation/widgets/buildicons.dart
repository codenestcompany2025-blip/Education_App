import 'package:flutter/material.dart';

class BuildSocialButton extends StatelessWidget {
  final String imagePath;
  const BuildSocialButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Image.asset(imagePath),
    );
  }
}

