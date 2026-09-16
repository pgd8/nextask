import 'package:flutter/material.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/styles/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final bool? isHome;
  final Color? backgrounColor;
  const CustomAppBar({super.key, this.isHome, this.backgrounColor});

  @override
  Widget build(BuildContext context) {
    return isHome == true
        ? Container(
          padding: .all(10),
            decoration: BoxDecoration(
              color: backgrounColor ?? ColorsManager.whiteColor,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome To ',
                            style: TextStyles.textStyleBlackM14(context),
                          ),
                          TextSpan(
                            text: 'Nextask',
                            style: TextStyles.textStylePrimaryLightColorB14(
                              context,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('The best todolist app'),
                  ],
                ),
              ],
            ),
          )
        : Container();
  }
}
