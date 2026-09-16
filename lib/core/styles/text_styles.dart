import 'package:flutter/material.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class TextStyles {
  // regular
  static TextStyle textStyleBlackR9(BuildContext context) => TextStyle(
    color: ColorsManager.blackColor,
    fontWeight: .w400,
    fontSize: Units.getFontSize(fontSize: 9, context: context),
  );

  static TextStyle textStyleBlackR11(BuildContext context) => TextStyle(
    color: ColorsManager.blackColor,
    fontWeight: .w400,
    fontSize: Units.getFontSize(fontSize: 11, context: context),
  );

  static TextStyle textStyleBlackR14(BuildContext context) => TextStyle(
    color: ColorsManager.blackColor,
    fontWeight: .w400,
    fontSize: Units.getFontSize(fontSize: 14, context: context),
  );

  static TextStyle textStyleNeutralSecondaryR11(BuildContext context) =>
      TextStyle(
        color: ColorsManager.neutralSecondaryColor,
        fontWeight: .w400,
        fontSize: Units.getFontSize(fontSize: 11, context: context),
      );

  static TextStyle textStyleWhiteR11(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontWeight: .w400,
    fontSize: Units.getFontSize(fontSize: 11, context: context),
  );

  static TextStyle textStyleWhiteR14(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontWeight: .w400,
    fontSize: Units.getFontSize(fontSize: 14, context: context),
  );

  static TextStyle textStyleWhiteR36(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: Units.getFontSize(fontSize: 36, context: context),
  );
  //medium
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

  static TextStyle textStyleBlackM14(BuildContext context) => TextStyle(
    color: ColorsManager.blackColor,
    fontWeight: .w500,
    fontSize: Units.getFontSize(fontSize: 14, context: context),
  );

  static TextStyle textStyleBlackM15(BuildContext context) => TextStyle(
    color: ColorsManager.blackColor,
    fontWeight: .w500,
    fontSize: Units.getFontSize(fontSize: 15, context: context),
  );

  //bold
  static TextStyle textStyleWhiteB25(BuildContext context) => TextStyle(
    color: ColorsManager.whiteColor,
    fontWeight: .bold,
    fontSize: Units.getFontSize(fontSize: 25, context: context),
  );

  static TextStyle textStylePrimaryLightColorB14(BuildContext context) =>
      TextStyle(
        color: ColorsManager.primaryLightColor,
        fontSize: Units.getFontSize(fontSize: 14, context: context),
        fontWeight: .bold,
      );
}
