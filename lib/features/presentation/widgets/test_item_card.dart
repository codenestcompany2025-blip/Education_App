import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class TestItemCard extends StatelessWidget {
  final String title;
  final bool isOpen;
  final bool passed; // نجح ولا مش راسب/لسا
  final String statusText;
  const TestItemCard({
    super.key,
    required this.title,
    required this.isOpen,
    required this.passed,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.grayColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                isOpen ? Icons.lock_open : Icons.lock_outline,
                color: isOpen ? AppColors.blueColor : AppColors.grayColor,
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
                passed
                    ? 'ناجح'
                    : (isOpen ? 'جاهز' : 'مغلق'),
                style: TextStyle(
                  color: passed
                      ? AppColors.blueColor
                      : (isOpen ? AppColors.blueColor : AppColors.redColor),
                  fontFamily: 'Cairo-Bold',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(
                Icons.alarm ,
                size: 18,
                color:
                isOpen  ? AppColors.blueColor : AppColors.blackColor,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontFamily: 'Cairo-Bold',
                    fontSize: 13,
                    color: isOpen
                        ? AppColors.blueColor
                        : AppColors.redColor,
                  ),
                ),
              ),
              Icon(
                isOpen &&statusText=='منجز' ? Icons.done :  isOpen &&statusText=='جاهز' ? Icons.lock_open : Icons.lock_outline,
                color: isOpen ? AppColors.blueColor : AppColors.grayColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
