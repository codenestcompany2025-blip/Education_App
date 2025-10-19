import 'package:eduaction_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppButtons {
  const AppButtons._();

  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
    Color background = AppColors.blueColor,
    Color color = AppColors.whiteColor,
    double width = double.infinity,
    double borderRadius = 12,
  }) => SizedBox(
    height: 48,
    width: width,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );

  static Widget outlinedButton({
    required String text,
    required VoidCallback onPressed,
    required Color color,
    Color background = AppColors.whiteColor,
    double width = double.infinity,
    double borderRadius = 12,
  }) => SizedBox(
    height: 48,
    width: width,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
