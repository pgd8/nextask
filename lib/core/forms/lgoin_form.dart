import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nextask/core/shared/widgets/custom_main_button.dart';
import 'package:nextask/core/shared/widgets/custom_main_text_button.dart';
import 'package:nextask/core/shared/widgets/text_input_field.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/text_styles.dart';
import 'package:nextask/core/utils/units.dart';
import 'package:nextask/core/utils/validators.dart';

class LgoinForm extends StatefulWidget {
  const LgoinForm({super.key});

  @override
  State<LgoinForm> createState() => _LgoinFormState();
}

class _LgoinFormState extends State<LgoinForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: Units.getVerticalPadding(
          verticalPadding: 10,
          context: context,
        ),
        children: [
          TextInputField(
            controller: _emailController,
            hintText: 'E-mail',
            validator: Validators.emailValidator,
          ),
          SizedBox(
            height: Units.getVerticalPadding(
              verticalPadding: 10,
              context: context,
            ),
          ),
          TextInputField(
            controller: _passwordController,
            isPassword: true,
            hintText: 'Password',
            iconPath: AssetsManager.lockIcon,
            validator: Validators.passwordValidator,
          ),
          Container(
            alignment: .centerEnd,
            child: CustomMainTextButton(
              btnTitle: 'Forgot password?',
              onTap: () {},
            ),
          ),
          CustomMainButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                log('login button Clicked!!');
              }
            },
            btnTitle: 'Sign in',
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyles.textStyleWhiteR14(context),
                ),
                TextSpan(
                  text: 'Sign up',
                  style: TextStyles.textStylePrimaryLightColorB14(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
