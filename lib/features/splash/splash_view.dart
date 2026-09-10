import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/styles/text_styles.dart';
import 'package:nextask/core/utils/units.dart';
import 'package:nextask/features/login/login_view.dart';

class SplashView extends StatefulWidget {
  static const routeName = '/splash-view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    routeToLoginView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(
              AssetsManager.appLogoIcon,
              height: Units.getHeight(widgetHeight: 100, context: context),
              width: Units.getWidth(widgetWidth: 100, context: context),
            ),
            Text('NexTask', style: TextStyles.textStyleWhiteR36(context)),
          ],
        ),
      ),
    );
  }

  void routeToLoginView() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
  }
}
