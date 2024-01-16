import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _textStyleManager(double fontSize, FontWeight fontWeight, Color color,
    double height, TextDecoration textDecoration) {
  return GoogleFonts.aBeeZee(
      decoration: textDecoration,
      height: height,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

// regular text
TextStyle regularTextStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1,
    TextDecoration textDecoration = TextDecoration.none}) {
  return _textStyleManager(
      fontSize, FontWeightManager.regular, color, height, textDecoration);
}

// bold text
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1,
    TextDecoration textDecoration = TextDecoration.none}) {
  return _textStyleManager(
      fontSize, FontWeightManager.bold, color, height, textDecoration);
}

// light text
TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1,
    TextDecoration textDecoration = TextDecoration.none}) {
  return _textStyleManager(
      fontSize, FontWeightManager.light, color, height, textDecoration);
}

// medium text
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1,
    TextDecoration textDecoration = TextDecoration.none}) {
  return _textStyleManager(
      fontSize, FontWeightManager.medium, color, height, textDecoration);
}

// semi bold
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1,
    TextDecoration textDecoration = TextDecoration.none}) {
  return _textStyleManager(
      fontSize, FontWeightManager.semiBold, color, height, textDecoration);
}

// extra bold
TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1,
    TextDecoration textDecoration = TextDecoration.none}) {
  return _textStyleManager(
      fontSize, FontWeightManager.extraBold, color, height, textDecoration);
}

// black
TextStyle getBlackStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1,
    TextDecoration textDecoration = TextDecoration.none}) {
  return _textStyleManager(
      fontSize, FontWeightManager.black, color, height, textDecoration);
}
