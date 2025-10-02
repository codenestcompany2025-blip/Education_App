import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final String? font;

  const CustomTextField({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.font,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: size, fontFamily: font),
    );
  }
}
