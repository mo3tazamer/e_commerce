import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'color_manager.dart';

ThemeData customizeApplicationTheme() {
  return ThemeData(

    //materialTapTargetSize:  MaterialTapTargetSize.shrinkWrap,
    scaffoldBackgroundColor: ColorManager.white,

    //main color
    canvasColor: ColorManager.primary,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightGrey,
    primaryColorDark: ColorManager.darkGrey,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.grey,
    progressIndicatorTheme:   const ProgressIndicatorThemeData(
      color: ColorManager.primary,
    ),

    //appbar
    appBarTheme:   const AppBarTheme(
      systemOverlayStyle:  SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary,
        statusBarIconBrightness: Brightness.light

      ),

      backgroundColor: ColorManager.primary,


      elevation: 5,
      shadowColor: ColorManager.darkGrey,
    ),
    //card
    // cardTheme: const CardTheme(
    //   color: ColorManager.white,
    //   shadowColor: ColorManager.lightGrey,
    //   elevation: 5,
    // ),
  );
}
