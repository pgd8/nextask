import 'package:flutter/material.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class Constants {
  //collections
  static const tasksCollection = 'tasks';
  //appbar size
  static Size getAppBarSize(BuildContext context) =>
      Size(.infinity, Units.getHeight(widgetHeight: 100, context: context));
  //boxDecorations
  static BoxDecoration boxDecorationLinearGradiantPrimaryAndDarkColors =
      BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorsManager.primaryColor, ColorsManager.primaryDarkColor],
          begin: .topCenter,
          end: .bottomCenter,
        ),
      );
}
