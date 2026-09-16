import 'package:flutter/material.dart';

class Units {

  static const double figmaHeight = 731;
  static const double figmaWidth = 411;

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
  }) => (MediaQuery.of(context).size.width * fontSize) / figmaWidth;

  static double getPercentHeight({
    required double percentHeight,
    required BuildContext context,
  }) => (MediaQuery.of(context).size.height * percentHeight) / 100;

  static double getPercentWidth({
    required double percentWidth,
    required BuildContext context,
  }) => (MediaQuery.of(context).size.width * percentWidth) / 100;

  static double getRadius({
    required double radius,
    required BuildContext context,
  }) => (MediaQuery.of(context).size.width * radius) / figmaWidth;

  static double getHorizontalPadding({
    required double horizontalPadding,
    required BuildContext context,
  }) => getWidth(widgetWidth: horizontalPadding, context: context);

  static double getVerticalPadding({
    required double verticalPadding,
    required BuildContext context,
  }) => getHeight(widgetHeight: verticalPadding, context: context);
}
