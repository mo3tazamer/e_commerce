import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/textstyle_manager.dart';
import 'package:flutter/material.dart';

import '../../core/theme/font_manager.dart';

mySnakeBar({String? message, required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 450),
      shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(35))),
      backgroundColor: ColorManager.primary,
      content: Center(
        child: Text(message!,
            style: getMediumStyle(
                color: ColorManager.black, fontSize: FontSize.s18)),
      )));
}
