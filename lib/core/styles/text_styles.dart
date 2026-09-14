import 'package:flutter/material.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class TextStyles {
  static TextStyle textStyleWhiteR36(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: Units.getFontSize(fontSize: 36, context: context),
  );

  static TextStyle textStyleWhiteM18(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontWeight: .w500,
    fontSize: Units.getFontSize(fontSize: 18, context: context),
  );

  static TextStyle textStyleWhiteM20(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontWeight: .w500,
    fontSize: Units.getFontSize(fontSize: 20, context: context),
  );

  static TextStyle textStyleWhiteM25(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontWeight: .w500,
    fontSize: Units.getFontSize(fontSize: 25, context: context),
  );

  static TextStyle textStyleWhiteB25(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontWeight: .bold,
    fontSize: Units.getFontSize(fontSize: 25, context: context),
  );
}
