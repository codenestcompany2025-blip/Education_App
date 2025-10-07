import 'package:flutter/material.dart';

class CustomEditTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isRequired;

  const CustomEditTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPassword = false, // 🔹 افتراضي مش كلمة مرور
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isRequired = false,
  });

  @override
  State<CustomEditTextField> createState() => _CustomEditTextFieldState();
}

class _CustomEditTextFieldState extends State<CustomEditTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.rtl,
      controller: widget.controller,
      textAlign: TextAlign.right,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: widget.isRequired
            ? "${widget.labelText} "
            : widget.labelText,
        prefixIcon:  widget.suffixIcon != null
            ? Icon(widget.suffixIcon)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon:
          widget.isPassword
          ? IconButton(
          icon: Icon(_isPasswordVisible
          ? Icons.visibility
          : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    )
        : (widget.prefixIcon != null
    ? Icon(widget.prefixIcon)
        : null),

      ),
    );
  }
}
