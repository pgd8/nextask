import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextask/core/shared/widgets/category_picker.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/styles/text_styles.dart';
import 'package:nextask/core/utils/units.dart';

class PiriorityCategorySelector extends StatelessWidget {
  final bool isCategorySelector;
  const PiriorityCategorySelector({
    super.key,
    required this.isCategorySelector,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CategoryPicker(),
        );
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
              isCategorySelector
                  ? AssetsManager.categoryIcon
                  : AssetsManager.flagIcon,
              colorFilter: .mode(ColorsManager.neutralSecondaryColor, .srcIn),
            ),
            Text(
              isCategorySelector ? 'select Category' : 'select Piriority',
              style: TextStyles.textStyleNeutralSecondaryR11(context),
            ),
          ],
        ),
      ),
    );
  }
}
