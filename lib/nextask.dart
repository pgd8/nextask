import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextask/core/navigation/app_router.dart';
import 'package:nextask/core/styles/app_theme.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class Nextask extends StatelessWidget {
  const Nextask({super.key});

  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorsManager.whiteColor,
      statusBarIconBrightness: .dark
    ),
  );
    return ScreenUtilInit(
      designSize: Size(Units.figmaWidth, Units.figmaHeight),
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      child: SafeArea(
        top: true,
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: AppTheme.appTheme,
          title: 'Nextask',
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
