import 'package:flutter/material.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';

import '../../../core/constants/colors.dart';

class SectionHeaderWithLines extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionHeaderWithLines({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.blackColor,
            thickness: 1,
            endIndent: 10,
          ),
        ),
        Row(
          children: [
            Icon(icon, size: 28, color: AppColors.blackColor),
            const SizedBox(width: 6),
            customTextField(
              text: title,
              size: 14,
              color: AppColors.blackColor,
              weight: FontWeight.bold,
            ),
          ],
        ),
        const Expanded(
          child: Divider(
            color: AppColors.blackColor,
            thickness: 1,
            indent: 10,
          ),
        ),
      ],
    );
  }
}
