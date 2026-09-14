import 'package:flutter/material.dart';
import 'package:nextask/core/styles/text_styles.dart';
import 'package:nextask/core/utils/units.dart';

class OnboardingTab extends StatelessWidget {
  final String imagePath;
  final String description;
  const OnboardingTab({
    super.key,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceEvenly,
      children: [
        Image.asset(
          imagePath,
          width: Units.getWidth(widgetWidth: 297, context: context),
          height: Units.getHeight(widgetHeight: 281, context: context),
        ),
        Text(description, style: TextStyles.textStyleWhiteM20q(context),textAlign: .center,),
      ],
    );
  }
}
