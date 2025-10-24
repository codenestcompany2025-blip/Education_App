import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class TestCard extends StatelessWidget {
  final String title;
  final bool unlocked;
  final bool passed;

  const TestCard({
    super.key,
    required this.title,
    this.unlocked = false,
    this.passed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.grayColor),
      ),
      child:

      Row(
        children: [
          Icon(
            unlocked ? Icons.lock_open : Icons.lock_outline,
            color: unlocked ? AppColors.blueColor : AppColors.grayColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Cairo-Regular',
                fontSize: 15,
                color: AppColors.blackColor,
              ),
            ),
          ),
          Text(
            passed ? 'ناجح' : 'مغلق',
            style: TextStyle(
              color: passed ? AppColors.blueColor : AppColors.redColor,
              fontFamily: 'Cairo-Bold',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
