import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class UnitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const UnitButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: blueColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Cairo-SemiBold',
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
