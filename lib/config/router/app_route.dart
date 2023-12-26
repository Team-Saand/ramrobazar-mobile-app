import 'package:ramrobazar/features/auth/presentation/view/user/home_page_view.dart';

import '../../features/auth/presentation/view/general/signin_view.dart';
import '../../features/auth/presentation/view/general/signup_view.dart';
import '../../features/auth/presentation/view/user/user_dashboard_view.dart';
import '../../features/auth/presentation/view/user/user_message_view.dart';
import '../../features/auth/presentation/view/user/user_notification_view.dart';
import '../../features/listing/presentation/view/create/add_listing_.dart';
import '../../features/listing/presentation/view/general/update_listing_view.dart';
import '../../features/listing/presentation/view/general/view_all_listing.dart';
import '../../features/listing/presentation/view/general/view_single_listing.dart';
import '../../features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();

  //general
  static const String splash = '/splash';
  static const String signin = '/signin';
  static const String signup = '/signup';
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
      home: (context) => const HomView(),

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
