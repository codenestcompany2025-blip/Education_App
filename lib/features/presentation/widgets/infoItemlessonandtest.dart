import 'package:eduaction_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'custom_textfield.dart';

class InfoItem extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const InfoItem({super.key,required IconData this.icon, required String this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Icon(icon, color: AppColors.blueColor, size: 22),
        const SizedBox(width: 10),
        customTextField(
          text: text!,
          size: 15,
          color: AppColors.blackColor,

        ),
      ],
    );
  }
}
