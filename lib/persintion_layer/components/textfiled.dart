import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  MyTextFiled(
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

  IconData? prefixIcon;
  IconButton? suffixIcon;
  String? hintText;
  String? validatorText;
  String? labelText;
  FocusNode? focusNode;
  FocusNode? focusNode2;
  TextEditingController? controller;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;
  bool? obscureText;

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
