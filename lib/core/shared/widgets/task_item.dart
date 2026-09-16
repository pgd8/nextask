import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/styles/text_styles.dart';
import 'package:nextask/core/utils/units.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.primaryLightColor,
        borderRadius: .circular(Units.getRadius(radius: 10, context: context)),
      ),
      padding: .only(
        top: Units.getVerticalPadding(verticalPadding: 20, context: context),
      ),
      child: Card(
        margin: .zero,
        color: ColorsManager.whiteColor,
        shadowColor: ColorsManager.neutralGhostColor,
        elevation: Units.getRadius(radius: 5, context: context),
        shape: ContinuousRectangleBorder(
          borderRadius: .vertical(
            top: .zero,
            bottom: .circular(Units.getRadius(radius: 10, context: context)),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  activeColor: ColorsManager.warningDefaultColor,
                  value: isCompleted,
                  onChanged: (value) {
                    setState(() {
                      isCompleted = value!;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Task Title',
                      style: TextStyles.textStyleBlackM15(context),
                    ),
                    Text(
                      'Task Decription',
                      style: TextStyles.textStyleBlackR9(context),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    DateTime.now().toString(),
                    style: TextStyles.textStyleNeutralSecondaryR11(context),
                  ),
                  Row(
                    spacing: Units.getHorizontalPadding(
                      horizontalPadding: 5,
                      context: context,
                    ),
                    mainAxisAlignment: .end,
                    children: [
                      Container(
                        padding: .all(3.5),
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryDarkColor,
                          borderRadius: .circular(
                            Units.getRadius(radius: 4, context: context),
                          ),
                        ),
                        child: Row(
                          spacing: Units.getHorizontalPadding(
                            horizontalPadding: 2,
                            context: context,
                          ),
                          children: [
                            SvgPicture.asset(AssetsManager.homeOutlineIcon),
                            Text(
                              'Home',
                              style: TextStyles.textStyleWhiteR11(context),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: .all(3.5),
                        decoration: BoxDecoration(
                          borderRadius: .circular(
                            Units.getRadius(radius: 4, context: context),
                          ),
                          border: .all(color: ColorsManager.primaryColor),
                        ),
                        child: Row(
                          spacing: Units.getHorizontalPadding(
                            horizontalPadding: 2,
                            context: context,
                          ),
                          children: [
                            SvgPicture.asset(AssetsManager.flagIcon),
                            Text(
                              '3',
                              style: TextStyles.textStyleBlackR14(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
