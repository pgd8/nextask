import 'package:flutter/material.dart';
import 'package:nextask/features/login/login_view.dart';
import 'package:nextask/features/splash/splash_view.dart';

class Nextask extends StatelessWidget {
  const Nextask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextask',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        LoginView.routeName: (context) => LoginView(),
      },
    );
  }
}
