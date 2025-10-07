import 'package:flutter/material.dart';

class CustomRadioOption extends StatelessWidget {
  final String title;
  final String iconPath;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  const CustomRadioOption({
    super.key,
    required this.title,
    required this.iconPath,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Image.asset(iconPath, width: 30, height: 30),
            const SizedBox(width: 18),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Cairo-SemiBold',
                fontSize: 16,
              ),
            ),
          ],
        ),
        Spacer(),
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.blue,
        ),
      ],
    );
  }
}
