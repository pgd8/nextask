import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nextask/core/shared/widgets/custom_main_button.dart';
import 'package:nextask/core/shared/widgets/custom_main_text_button.dart';
import 'package:nextask/core/shared/widgets/text_input_field.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/utils/units.dart';
import 'package:nextask/core/utils/validators.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late TextEditingController _fullNameController;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
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
            controller: _fullNameController,
            hintText: 'Full Name',
            validator: Validators.fullNameValidator,
            iconPath: AssetsManager.userIcon,
          ),
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
        ],
      ),
    );
  }
}
