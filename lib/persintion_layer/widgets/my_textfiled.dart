

import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.controller,
    this.validatorText,
    this.keyboardType,
    this.obscureText = false,
  });

  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final String? hintText;
  final String? validatorText;
  final String? labelText;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },



      keyboardAppearance: Brightness.dark,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
