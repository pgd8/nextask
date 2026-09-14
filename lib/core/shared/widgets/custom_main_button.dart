import 'package:flutter/material.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class CustomMainButton extends StatelessWidget {
  final String btnTitle;
  final VoidCallback onTap;
  final bool? isOutlined;
  final double? height;
  final double? width;
  final Color? btnColor;
  final Widget? customContent;
  final Color? btnTitleColor;
  final double? btnTitleSize;
  final FontWeight? btnTitleFontWeight;
  final double? btnBorderRadius;
  const CustomMainButton({
    required this.btnTitle,
    required this.onTap,
    super.key,
    this.isOutlined,
    this.height,
    this.width,
    this.btnColor,
    this.customContent,
    this.btnTitleColor,
    this.btnTitleFontWeight,
    this.btnTitleSize,
    this.btnBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Units.getHeight(widgetHeight: height ?? 42, context: context),
      width: width != null
          ? Units.getWidth(widgetWidth: width ?? 0, context: context)
          : .infinity,
      child: isOutlined == true
          ? OutlinedButton(onPressed: onTap, child: Text(''))
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: btnColor ?? ColorsManager.primaryLightColor,
                shape: ContinuousRectangleBorder(
                  borderRadius: .circular(
                    Units.getRadius(
                      radius: btnBorderRadius ?? 10,
                      context: context,
                    ),
                  ),
                ),
              ),
              onPressed: onTap,
              child:
                  customContent ??
                  Text(
                    btnTitle,
                    style: TextStyle(
                      color: btnTitleColor ?? ColorsManager.whiteColor,
                      fontSize:
                          btnTitleSize ??
                          Units.getFontSize(fontSize: 18, context: context),
                      fontWeight: btnTitleFontWeight ?? .w500,
                    ),
                  ),
            ),
    );
  }
}
