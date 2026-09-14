import 'package:flutter/material.dart';
import 'package:nextask/core/utils/units.dart';

class CustomMainTextButton extends StatelessWidget {
  final String btnTitle;
  final VoidCallback onTap;
  final Color? btnTitleColor;
  final double? btnTitleSize;
  final FontWeight? btnTitleFontWeight;

  const CustomMainTextButton({
    super.key,
    required this.btnTitle,
    required this.onTap,
    this.btnTitleColor,
    this.btnTitleSize,
    this.btnTitleFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        btnTitle,
        style: TextStyle(
          color: btnTitleColor ?? Colors.white,
          fontSize:
              btnTitleSize ?? Units.getFontSize(fontSize: 14, context: context),
          fontWeight: btnTitleFontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
