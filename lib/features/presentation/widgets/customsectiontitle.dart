import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

Widget SectionTitle({required String subject, required String semester}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child: customTextField(text: 'مادة $subject / $semester', color: AppColors.blueColor, size: 17),
);
