import 'package:flutter/material.dart';

class CardOfMaterial extends StatelessWidget {
  final String imagePath;
  final String nameMaterial;
  final VoidCallback? onTap; // 🔹 دالة بتنادي لما يضغط المستخدم

  const CardOfMaterial({
    super.key,
    required this.imagePath,
    required this.nameMaterial,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // 🔹 صار الكرت قابل للضغط
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.blue.withOpacity(0.2), // 🔹 تأثير عند الضغط
      child: Container(
        width: 100,
        height: 110,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 45,
              height: 45,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              nameMaterial,
              style: const TextStyle(
                fontFamily: 'Cairo-Bold',
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
