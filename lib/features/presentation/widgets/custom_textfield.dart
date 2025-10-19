import 'package:flutter/material.dart';

Widget customTextField({
  required String text,
  Color? color,
  required double size,
  FontWeight weight = FontWeight.bold,
}) => Text(
  text,
  style: TextStyle(color: color, fontSize: size, fontWeight: weight),
);
