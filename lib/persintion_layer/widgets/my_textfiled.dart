import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled(
      {super.key,
      this.focusNode,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.labelText,
      this.controller,
      this.textInputAction,
      this.validatorText,
      this.keyboardType,
      this.focusNode2,
      this.obscureText});

  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final String? hintText;
  final String? validatorText;
  final String? labelText;
  final FocusNode? focusNode;
  final FocusNode? focusNode2;
  final TextEditingController? controller;
  final  TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      keyboardType: keyboardType,
      controller: controller,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(focusNode2);
      },
      // Move focus to the next text field when the "Next" button is pressed
      // FocusScope.of(context).requestFocus(focusNode2);

      focusNode: focusNode,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
