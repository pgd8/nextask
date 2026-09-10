import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nextask/core/navigation/routes.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    routeToOnboarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: Center(
        child: SvgPicture.asset(
          AssetsManager.appLogoIcon,
          height: Units.getHeight(widgetHeight: 200, context: context),
          width: Units.getWidth(widgetWidth: 200, context: context),
        ),
      ),
    );
  }

  void routeToOnboarding() {
    Future.delayed(Duration(seconds: 3), () {
      context.go(Routes.kOnboardingView);
    });
  }
}
