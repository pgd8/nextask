import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextask/core/forms/signup_form.dart';
import 'package:nextask/core/navigation/routes.dart';
import 'package:nextask/core/shared/widgets/app_logo_widget.dart';
import 'package:nextask/core/styles/text_styles.dart';
import 'package:nextask/core/utils/constants.dart';
import 'package:nextask/core/utils/units.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
            spacing: Units.getVerticalPadding(
              verticalPadding: 10,
              context: context,
            ),
            crossAxisAlignment: .start,
            children: [
              const AppLogoWidget(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome To ',
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
                'create an account and Join us now!!',
                style: TextStyles.textStyleWhiteM18(context),
              ),
              SignupForm(),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyles.textStyleWhiteR14(context),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go(Routes.kLoginView);
                          },
                        style: TextStyles.textStylePrimaryLightColorB14(
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
