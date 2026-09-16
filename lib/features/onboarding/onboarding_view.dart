import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nextask/core/navigation/routes.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/constants.dart';
import 'package:nextask/core/utils/units.dart';
import 'package:nextask/features/onboarding/widgets/onboarding_tab.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorsManager.primaryColor,
        statusBarIconBrightness: .light,
      ),
    );
    return Container(
      decoration: Constants.boxDecorationLinearGradiantPrimaryAndDarkColors,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorsManager.whiteColor,
          shape: CircleBorder(),
          isExtended: true,
          elevation: Units.getHeight(widgetHeight: 10, context: context),
          child: SvgPicture.asset(
            AssetsManager.arrowRightIcon,
            height: Units.getHeight(widgetHeight: 60, context: context),
            width: Units.getWidth(widgetWidth: 60, context: context),
            colorFilter: .mode(ColorsManager.primaryDarkColor, .srcIn),
          ),
          onPressed: () {
            if (_pageController.page == 3) {
              context.go(Routes.kLoginView);
            } else {
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
        body: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            SizedBox.shrink(),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _buildOnboardingPages(),
              ),
            ),
            SizedBox(
              height: Units.getPercentHeight(
                percentHeight: 20,
                context: context,
              ),
              child: SmoothPageIndicator(
                controller: _pageController, // PageController
                count: _buildOnboardingPages().length,
                effect: WormEffect(
                  activeDotColor: ColorsManager.whiteColor,
                  dotHeight: Units.getHeight(
                    widgetHeight: 10,
                    context: context,
                  ),
                  dotWidth: Units.getWidth(widgetWidth: 10, context: context),
                  type: WormType.normal,
                  // strokeWidth: 5,
                ), // your preferred effect
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOnboardingPages() {
    return [
      OnboardingTab(
        imagePath: AssetsManager.onboardingOneImage,
        description: 'Welcome to Nextask',
      ),
      OnboardingTab(
        imagePath: AssetsManager.onboardingTwoImage,
        description: 'Organize Your Tasks',
      ),
      OnboardingTab(
        imagePath: AssetsManager.onboardingThreeImage,
        description: 'Stay Productive',
      ),
      OnboardingTab(
        imagePath: AssetsManager.onboardingFourImage,
        description: 'You informations are \nsecure with us',
      ),
    ];
  }
}
