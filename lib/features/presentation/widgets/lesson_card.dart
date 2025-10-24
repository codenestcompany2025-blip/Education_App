import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/presentation/widgets/infoItemlessonandtest.dart';
import 'package:flutter/material.dart';
class LessonCard extends StatelessWidget {
  final String title;
  final bool unlocked;
  final bool completed;

  const LessonCard({
    super.key,
    required this.title,
    this.unlocked = false,
    this.completed = false,
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
            color: AppColors.blackColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoItem(icon:Icons.play_circle_outline, text: ' الدرس الاول / تفاضل وتكامل'),
          SizedBox(height: 10),
          InfoItem(icon:Icons.access_alarm,text:  ' متاح'),
          SizedBox(height: 10),
        ],
      ),
    );

  }
}


