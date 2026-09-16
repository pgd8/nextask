import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextask/core/data/models/category_model.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/units.dart';

class CategoryPicker extends StatelessWidget {
  const CategoryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: .only(
          bottom: Units.getVerticalPadding(
            verticalPadding: 10,
            context: context,
          ),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(alignment: .topEnd, child: CloseButton()),
            SizedBox(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: Units.getVerticalPadding(
                    verticalPadding: 4,
                    context: context,
                  ),
                ),
                itemCount: _buildCategories().length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  height: Units.getHeight(widgetHeight: 42, context: context),
                  padding: .symmetric(
                    horizontal: Units.getHorizontalPadding(horizontalPadding: 5, context: context)
                  ),
                  margin: .symmetric(
                    horizontal: Units.getHorizontalPadding(
                      horizontalPadding: 10,
                      context: context,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: _buildCategories()[index].categoryColor,
                    border: .all(color: ColorsManager.neutralLineColor),
                    borderRadius: .circular(
                      Units.getRadius(radius: 5, context: context),
                    ),
                  ),
                  child: Row(
                    spacing: Units.getHorizontalPadding(horizontalPadding: 3, context: context),
                    children: [
                      SvgPicture.asset(
                        _buildCategories()[index].iconPath,
                        colorFilter: .mode(
                          _buildCategories()[index].categoryIconColor,
                          .srcIn,
                        ),
                      ),
                      Text(_buildCategories()[index].categoryName),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CategoryModel> _buildCategories() => [
    CategoryModel(
      categoryName: 'Home',
      iconPath: AssetsManager.homeOutlineIcon,
      categoryColor: ColorsManager.warningBackgroundColor,
      categoryIconColor: ColorsManager.warningDarkColor,
    ),
    CategoryModel(
      categoryName: 'Work',
      iconPath: AssetsManager.briefcaseIcon,
      categoryColor: ColorsManager.errorBackgroundColor,
      categoryIconColor: ColorsManager.errorDarkColor,
    ),
    CategoryModel(
      categoryName: 'University',
      iconPath: AssetsManager.universityIcon,
      categoryColor: ColorsManager.primaryLightColor,
      categoryIconColor: ColorsManager.primaryColor,
    ),
    CategoryModel(
      categoryName: 'School',
      iconPath: AssetsManager.universityIcon,
      categoryIconColor: ColorsManager.neutralPrimaryColor,
      categoryColor: ColorsManager.neutralBackgroundColor,
    ),
  ];
}
