import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class LessonProgressCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final int currentLesson;
  final int totalLessons;

  const LessonProgressCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.currentLesson,
    required this.totalLessons,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentLesson / totalLessons;

    return Container(
      width: 190,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 110,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Cairo-Bold',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_book_outlined, size: 16, color: Colors.black54),
              const SizedBox(width: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'Cairo-Regular',
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              value: progress,
              color: blueColor,
              backgroundColor: Colors.grey[300],
              minHeight: 4,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "$currentLesson/$totalLessons",
            style: const TextStyle(
              fontFamily: 'Cairo-Regular',
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
