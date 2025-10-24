import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';
class UnitInfoCard extends StatelessWidget {
  final int lessonsCount;
  final int testsCount;
  final String duration;

  const UnitInfoCard({
    super.key,
    required this.lessonsCount,
    required this.testsCount,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _infoItem(Icons.play_circle_outline, '$lessonsCount دروس'),
          SizedBox(height: 10,),
          _infoItem(Icons.quiz_outlined, '$testsCount اختبارات'),
          SizedBox(height: 10,),
          _infoItem(Icons.timer_outlined, duration),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String text) {
    return Row(
      children: [
        const SizedBox(width: 10),

        Icon(icon, color: AppColors.blueColor, size: 22),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Cairo-Regular',
            fontSize: 14,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
