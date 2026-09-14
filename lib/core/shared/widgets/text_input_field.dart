import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController _controller;
  final String hintText;
  final Color? cursorColor;
  final bool? enabeld;
  final bool? isFilled;
  final Color? fillColor;
  final bool? isPassword;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final String? iconPath;
  final Color? iconColor;
  final String? Function(String?)? validator;

  const TextInputField({
    super.key,
    required this._controller,
    required this.hintText,
    this.cursorColor,
    this.enabeld,
    this.isFilled,
    this.fillColor,
    this.isPassword,
    this.inputAction,
    this.inputType,
    this.iconPath,
    this.iconColor,
    this.validator,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _obSecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: widget.cursorColor ?? ColorsManager.primaryDarkColor,
      validator:
          widget.validator ??
          (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
      controller: widget._controller,
      obscureText: (_obSecureText && widget.isPassword == true),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: Units.getFontSize(fontSize: 15, context: context),
          color: ColorsManager.errorDarkColor
        ),
        isDense: true,
        hintText: widget.hintText,
        enabled: widget.enabeld ?? true,
        filled: widget.isFilled ?? true,
        fillColor: widget.fillColor ?? ColorsManager.whiteColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            widget.iconPath ?? AssetsManager.smsIcon,
            colorFilter: .mode(
              widget.iconColor ?? ColorsManager.primaryDarkColor,
              .srcIn,
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: Units.getWidth(widgetWidth: 15, context: context),
          minHeight: Units.getHeight(widgetHeight: 10, context: context),
        ),
        suffixIcon: widget.isPassword == true
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _obSecureText = !_obSecureText;
                      log(_obSecureText.toString());
                    });
                  },
                  child: SvgPicture.asset(
                    _obSecureText
                        ? AssetsManager.eyeIcon
                        : AssetsManager.eyeOffIcon,
                  ),
                ),
              )
            : SizedBox.shrink(),
        suffixIconConstraints: BoxConstraints(
          minWidth: Units.getWidth(widgetWidth: 15, context: context),
          minHeight: Units.getHeight(widgetHeight: 10, context: context),
        ),
        border: OutlineInputBorder(
          borderRadius: .circular(Units.getRadius(radius: 5, context: context)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(Units.getRadius(radius: 5, context: context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(Units.getRadius(radius: 5, context: context)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(Units.getRadius(radius: 5, context: context)),
          borderSide: BorderSide(color: ColorsManager.errorDefaultColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: .circular(Units.getRadius(radius: 5, context: context)),
          borderSide: BorderSide(color: ColorsManager.errorFocusedColor),
        ),
      ),
    );
  }
}
