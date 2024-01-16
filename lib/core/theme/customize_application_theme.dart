import 'package:flutter/material.dart';


import 'color_manager.dart';

ThemeData customizeApplicationTheme() {
  return ThemeData(
    useMaterial3:false,
    materialTapTargetSize:  MaterialTapTargetSize.shrinkWrap,
    scaffoldBackgroundColor: ColorManager.white,

    //main color
    canvasColor: ColorManager.primary,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightGrey,
    primaryColorDark: ColorManager.darkGrey,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.grey,
    //appbar
    appBarTheme:  const AppBarTheme(
      backgroundColor: ColorManager.primary,

      elevation: 5,
      shadowColor: ColorManager.darkGrey,
    ),
    //card
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.lightGrey,
      elevation: 5,
    ),
  );
}
