import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // 🔒 المستخدم ما يقدر يسكر بالضغط برة
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ✅ دائرة الأيقونة
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.blue[50], shape: BoxShape.circle),
                child: const Icon(Icons.check_circle, color: Colors.blue, size: 48),
              ),
              const SizedBox(height: 20),

              // ✅ النص
              const Text(
                "تم إعادة تعيين كلمة المرور بنجاح",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontFamily: 'Cairo-SemiBold', color: Colors.black),
              ),
              const SizedBox(height: 25),

              // ✅ زر تسجيل الدخول
              AppButtons.primaryButton(
                text: 'تسجيل دخول',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
                width: double.infinity,
                borderRadius: 8,
              ),
            ],
          ),
        ),
      );
    },
  );
}
