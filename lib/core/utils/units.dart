import 'package:flutter/material.dart';

class Units {
  static const figmaHeight = 731;
  static const figmaWidth = 411;

  static double getHeight({
    required double widgetHeight,
    required BuildContext context,
  }) => (MediaQuery.of(context).size.height * widgetHeight) / figmaHeight;

  static double getWidth({
    required double widgetWidth,
    required BuildContext context,
  }) => (MediaQuery.of(context).size.height * widgetWidth) / figmaWidth;

  static double getFontSize({
    required double fontSize,
    required BuildContext context,
  }) => (MediaQuery.of(context).size.height * fontSize) / figmaWidth;
}
