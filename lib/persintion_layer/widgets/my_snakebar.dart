

import 'package:flutter/material.dart';

 mySnakeBar({ String? message, required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: const Duration(milliseconds: 350),
      shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(35))),
      backgroundColor: Colors.green,
      content: Center(child: Text(message!))));
}
