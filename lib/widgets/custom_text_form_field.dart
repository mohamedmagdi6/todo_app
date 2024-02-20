import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.onFieldSubmitted,
    this.validator,
  });
  final IconData? prefixIcon;
  final String? hintText;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.5)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue))),
    );
  }
}
