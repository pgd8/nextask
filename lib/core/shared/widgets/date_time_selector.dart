import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/styles/text_styles.dart';
import 'package:nextask/core/utils/units.dart';

class DateTimeSelector extends StatelessWidget {
  final bool isDateSelector;
  const DateTimeSelector({super.key, required this.isDateSelector});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isDateSelector
            ? showDatePicker(
                context: context,
                firstDate: .now(),
                confirmText: 'Done',
                lastDate: DateTime(2080),
              )
            : showTimePicker(context: context, initialTime: .now(),);
      },
      child: Container(
        width: Units.getPercentWidth(percentWidth: 40, context: context),
        height: Units.getHeight(widgetHeight: 52, context: context),
        padding: .all(5),
        decoration: BoxDecoration(
          borderRadius: .circular(
            Units.getRadius(radius: 10, context: context),
          ),
          border: .all(color: ColorsManager.neutralLineColor),
        ),
        child: Row(
          spacing: Units.getHorizontalPadding(
            horizontalPadding: 4,
            context: context,
          ),
          children: [
            SvgPicture.asset(
              isDateSelector
                  ? AssetsManager.calendarIcon
                  : AssetsManager.timeIcon,
              colorFilter: .mode(ColorsManager.neutralSecondaryColor, .srcIn),
            ),
            Text(
              isDateSelector ? 'select Date' : 'select Time',
              style: TextStyles.textStyleNeutralSecondaryR11(context),
            ),
          ],
        ),
      ),
    );
  }
}
