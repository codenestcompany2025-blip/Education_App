import 'package:flutter/material.dart';

class CourseCategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String coursesCount;
  final VoidCallback? onTap;

  const CourseCategoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.coursesCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 170,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo-Bold',
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 5),
            Text(
              "$coursesCount كورس",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontFamily: 'Cairo-Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
