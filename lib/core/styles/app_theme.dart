import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextask/core/styles/colors_manager.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.transparentColor,
    checkboxTheme: CheckboxThemeData(shape: CircleBorder()),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorsManager.whiteColor,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorsManager.whiteColor,
      dayBackgroundColor: .resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.primaryLightColor;
        }
        return ColorsManager.whiteColor;
      }),
      todayForegroundColor: .resolveWith(
        (states) => ColorsManager.primaryLightColor,
      ),
      cancelButtonStyle: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: .resolveWith(
          (states) => ColorsManager.warningDarkColor,
        ),
      ),
      todayBackgroundColor: .resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.primaryLightColor;
        }
        return ColorsManager.whiteColor;
      }),
      todayBorder: BorderSide(color: ColorsManager.primaryLightColor),
      confirmButtonStyle: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        textStyle: .resolveWith(
          (states) => TextStyle(
            color: ColorsManager.primaryLightColor,
            fontSize: 14.sp,
            fontWeight: .bold,
          ),
        ),
        foregroundColor: .resolveWith(
          (states) => ColorsManager.primaryLightColor,
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      dayPeriodColor: ColorsManager.primaryLightColor.withAlpha(60),
      dialTextColor: ColorsManager.whiteColor,
      dayPeriodTextColor: ColorsManager.blackColor,
      dialBackgroundColor: ColorsManager.primaryColor,
      timeSelectorSeparatorColor: .resolveWith(
        (states) => ColorsManager.primaryDarkColor,
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: .resolveWith(
          (states) => ColorsManager.warningDefaultColor,
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      backgroundColor: ColorsManager.whiteColor,
      hourMinuteColor: ColorsManager.primaryLightColor.withAlpha(60),
      hourMinuteTextColor: ColorsManager.primaryDarkColor,
      dialHandColor: ColorsManager.warningDefaultColor,
      confirmButtonStyle: ButtonStyle(
        foregroundColor: .resolveWith(
          (states) => ColorsManager.primaryLightColor,
        ),
        splashFactory: NoSplash.splashFactory,
        textStyle: .resolveWith(
          (states) => TextStyle(
            color: ColorsManager.primaryLightColor,
            fontSize: 14.sp,
            fontWeight: .bold,
          ),
        ),
      ),
    ),
    dialogTheme: DialogThemeData(backgroundColor: ColorsManager.whiteColor),
  );
}
