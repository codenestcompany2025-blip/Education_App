import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class LessonItemCard extends StatelessWidget {
  final String lessonTitle;
  final bool isOpen;    // مفتوح ولا مقفول
  final bool isDone;    // منهي ولا لسا
  final String statusText; // "متاح" / "مغلق"

  const LessonItemCard({
    super.key,
    required this.lessonTitle,
    required this.isOpen,
    required this.isDone,
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
        border: Border.all(
          color: AppColors.grayColor,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الشريط الجانبي الأزرق
          Container(
            width: 4,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.blueColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(width: 10),

          // باقي التفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // السطر الأول: ايقونة الفيديو + عنوان الدرس + ايقونات الحالة
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.play_circle_outline,
                        size: 20, color: AppColors.blackColor),
                    const SizedBox(width: 6),

                    // عنوان الدرس
                    Expanded(
                      child: Text(
                        lessonTitle,
                        style: const TextStyle(
                          fontFamily: 'Cairo-Regular',
                          fontSize: 14,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),

                    const SizedBox(width: 6),

                    // لو منهي الدرس: علامتين صح خضر
                    if (isDone) ...[
                      Icon(Icons.event_available,
                          size: 18, color:AppColors.blueColor),
                      // const SizedBox(width: 4),
                      // Icon(Icons.check_circle,
                      //     size: 18, color: Colors.green.shade600),
                    ] else ...[
                      Icon(
                        isOpen ? Icons.lock_open : Icons.lock_outline,
                        size: 18,
                        color: isOpen ? AppColors.blueColor : AppColors.blackColor,
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 8),

                // السطر الثاني: حالة "متاح" أو "مغلق"
                Row(
                  children: [
                    Icon(
                     Icons.alarm ,
                      size: 18,
                      color: isOpen ? AppColors.blueColor : AppColors.blackColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      statusText,
                      style: TextStyle(
                        fontFamily: 'Cairo-Bold',
                        fontSize: 13,
                        color: isOpen
                            ? AppColors.blueColor
                            : AppColors.redColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
