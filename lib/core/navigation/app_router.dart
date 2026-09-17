import 'package:go_router/go_router.dart';
import 'package:nextask/core/navigation/routes.dart';
import 'package:nextask/features/home/presentaion/view/home_view.dart';
import 'package:nextask/features/login/login_view.dart';
import 'package:nextask/features/onboarding/onboarding_view.dart';
import 'package:nextask/features/signup/signup_view.dart';
import 'package:nextask/features/splash/splash_view.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: routes);

  static List<GoRoute> routes = [
    //splash view
    GoRoute(
      path: Routes.kSplashView,
      builder: (context, state) => SplashView(),
    ),
    //onboarding view
    GoRoute(
      path: Routes.kOnboardingView,
      builder: (context, state) => OnboardingView(),
    ),

    //login view
    GoRoute(path: Routes.kLoginView, builder: (context, state) => LoginView()),
    //signup view
    GoRoute(
      path: Routes.kSignupView,
      builder: (context, state) => const SignupView(),
    ),
    //home view
    GoRoute(path: Routes.kHomeView, builder: ((context, state) => HomeView())),
  ];
}
