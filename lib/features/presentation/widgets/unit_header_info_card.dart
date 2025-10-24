import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class UnitHeaderInfoCard extends StatelessWidget {
  final int lessonsCount;
  final int testsCount;
  final String durationText;

  const UnitHeaderInfoCard({
    super.key,
    required this.lessonsCount,
    required this.testsCount,
    required this.durationText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow(
            icon: Icons.play_circle_outline,
            text: '$lessonsCount دروس',
          ),
          const SizedBox(height: 10),
          _infoRow(
            // التصميم اللي بالصورة حاطط أيقونة لمبة / تنبيه
            icon: Icons.light_mode_outlined,
            text: '$testsCount اختبارات',
          ),
          const SizedBox(height: 10),
          _infoRow(
            icon: Icons.timer_outlined,
            text: durationText,
          ),
        ],
      ),
    );
  }

  Widget _infoRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: AppColors.blackColor, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Cairo-Regular',
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
