import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';

class SectionTitle extends StatelessWidget {
  final String subject;
  final String semester;

  const SectionTitle({
    super.key,
    required this.subject,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: CustomTextField(
        text: 'مادة $subject / $semester',
        color: blueColor,
        size: 17,
        font: 'Cairo-Bold',
      ),
    );
  }
}
