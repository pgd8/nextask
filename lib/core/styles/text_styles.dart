import 'package:flutter/material.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class TextStyles {
  
  static TextStyle textStyleWhiteR36(BuildContext context)=>  TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: Units.getFontSize(fontSize: 36, context: context),
  );
}
