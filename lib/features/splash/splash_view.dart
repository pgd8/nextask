import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextask/core/navigation/routes.dart';
import 'package:nextask/core/shared/widgets/app_logo_widget.dart';
import 'package:nextask/core/styles/colors_manager.dart';

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
      body: const AppLogoWidget(),
    );
  }

  void routeToOnboarding() {
    Future.delayed(Duration(seconds: 3), () {
      context.go(Routes.kOnboardingView);
    });
  }
}
