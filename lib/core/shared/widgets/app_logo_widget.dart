import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class AppLogoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? isColored;
  const AppLogoWidget({super.key, this.height, this.width, this.isColored});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isColored == true
          ? SvgPicture.asset(
              AssetsManager.appLogoIcon,
              height: Units.getHeight(
                widgetHeight: height ?? 200,
                context: context,
              ),
              width: Units.getWidth(
                widgetWidth: width ?? 200,
                context: context,
              ),
            )
          : SvgPicture.asset(
              AssetsManager.appLogoIcon,
              colorFilter: .mode(ColorsManager.whiteColor, .srcIn),
              height: Units.getHeight(
                widgetHeight: height ?? 200,
                context: context,
              ),
              width: Units.getWidth(
                widgetWidth: width ?? 200,
                context: context,
              ),
            ),
    );
  }
}
