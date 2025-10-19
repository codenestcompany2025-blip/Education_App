import 'package:eduaction_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget UnitButton({required String text, required VoidCallback onPressed}) => Container(
  margin: const EdgeInsets.symmetric(vertical: 5),
  width: double.infinity,
  child: OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.blueColor, width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 10),
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(fontFamily: 'Cairo-SemiBold', fontSize: 15, color: Colors.black87),
    ),
  ),
);
