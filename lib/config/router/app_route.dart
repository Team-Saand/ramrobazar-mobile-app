import '../../features/auth/presentation/view/landing_page_view.dart';
import '../../features/auth/presentation/view/signin_view.dart';
import '../../features/auth/presentation/view/signup_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String signinRoute = '/signin';
  static const String signupRoute = '/signup';
  static const String landingRoute = '/landing';
  static const String homeRoute = '/home';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashScreenView(),
      signinRoute: (context) => const SignInView(),
      signupRoute: (context) => const SignUpView(),
      landingRoute: (context) => const LandingPage(),
      homeRoute: (context) => const LandingPage(),
    };
  }
}
