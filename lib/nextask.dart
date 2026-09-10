import 'package:flutter/material.dart';
import 'package:nextask/core/navigation/app_router.dart';
import 'package:nextask/core/styles/app_theme.dart';

class Nextask extends StatelessWidget {
  const Nextask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.appTheme,
      title: 'Nextask',
      debugShowCheckedModeBanner: false,
    );
  }
}
