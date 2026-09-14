import 'package:flutter/material.dart';
import 'package:nextask/core/forms/lgoin_form.dart';
import 'package:nextask/core/shared/widgets/app_logo_widget.dart';
import 'package:nextask/core/styles/text_styles.dart';
import 'package:nextask/core/utils/constants.dart';
import 'package:nextask/core/utils/units.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/login-view';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Constants.boxDecorationLinearGradiantPrimaryAndDarkColors,
      child: Scaffold(
        body: Padding(
          padding: .symmetric(
            horizontal: Units.getHorizontalPadding(
              horizontalPadding: 10,
              context: context,
            ),
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const AppLogoWidget(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome Back To ',
                      style: TextStyles.textStyleWhiteM25(context),
                    ),
                    TextSpan(
                      text: 'Nextask',
                      style: TextStyles.textStyleWhiteB25(context),
                    ),
                  ],
                ),
              ),
              Text(
                'Have an other productive day !',
                style: TextStyles.textStyleWhiteM18(context),
              ),
             LgoinForm()
            ],
          ),
        ),
      ),
    );
  }
}
