import 'package:ramrobazar_mobile_app/features/auth/presentation/view/general/landing_page_view.dart';

import '../../features/advertisement/presentation/view/create/ad_basic_details.dart';
import '../../features/advertisement/presentation/view/general/update_ad_view.dart';
import '../../features/advertisement/presentation/view/general/view_all_ad.dart';
import '../../features/advertisement/presentation/view/general/view_single_ad.dart';
import '../../features/auth/presentation/view/general/signin_view.dart';
import '../../features/auth/presentation/view/general/signup_view.dart';
import '../../features/auth/presentation/view/user/user_dashboard_view.dart';
import '../../features/auth/presentation/view/user/user_message_view.dart';
import '../../features/auth/presentation/view/user/user_notification_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();

  //general
  static const String splash = '/splash';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String landing = '/landing';
  static const String home = '/home';

  //user
  static const String userMessage = '/userMessage';
  static const String userNotification = '/userNotification';
  static const String userDashboard = '/userDashboard';

  //ads
  static const String listingViewSingle = '/singleListing';
  static const String listingViewAll = '/allAd';

  static const String adBasicDetail = '/adBasicDetail';

  static const String adUpdate = '/adUpdate';

  static getApplicationRoute() {
    return {
      //general
      splash: (context) => const SplashScreenView(),
      signin: (context) => const SignInView(),
      signup: (context) => const SignUpView(),
      landing: (context) => const LandingPage(),
      home: (context) => const LandingPage(),

      //user
      userMessage: (context) => const UserMessageView(),
      userNotification: (context) => const UserNotificationView(),
      userDashboard: (context) => const UserDashboardView(),

      //ads
      listingViewSingle: (context) => const SingleListingView(),
      listingViewAll: (context) => const AllListingView(),

      adBasicDetail: (context) => const AdBasicDetailView(),
      adUpdate: (context) => const UpdateListingView()
    };
  }
}
