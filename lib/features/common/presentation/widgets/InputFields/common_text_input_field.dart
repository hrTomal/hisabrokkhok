import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final double? height;
  final String? hintText;
  final String? labelText;
  final bool isNumberOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    this.width,
    this.height,
    this.hintText,
    this.labelText,
    this.isNumberOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        keyboardType: isNumberOnly ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
