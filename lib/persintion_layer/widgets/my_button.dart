import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/textstyle_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/font_manager.dart';
  //ignore: must_be_immutable
class MyButton extends StatelessWidget {
  void Function()? onTap;
  final String buttonText;

  MyButton({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.all(12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: ColorManager.primary),
        child: Center(
            child: Text(
          buttonText,
          style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s18,),
        )),
      ),
    );
  }
}
