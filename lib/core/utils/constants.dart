import 'package:flutter/material.dart';
import 'package:nextask/core/styles/colors_manager.dart';

class Constants {
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
