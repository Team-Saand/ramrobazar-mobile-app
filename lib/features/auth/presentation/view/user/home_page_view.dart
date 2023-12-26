import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar/config/constants/theme_constant.dart';
import 'package:ramrobazar/features/auth/presentation/view/user/user_dashboard_view.dart';
import 'package:ramrobazar/features/auth/presentation/view/user/user_message_view.dart';
import 'package:ramrobazar/features/auth/presentation/view/user/user_notification_view.dart';
import 'package:ramrobazar/features/listing/presentation/view/general/view_all_listing.dart';

import '../../../../../config/router/app_route.dart';
import '../../../../listing/presentation/viewmodel/listing_view_model.dart';

class HomView extends ConsumerStatefulWidget {
  const HomView({super.key});

  @override
  ConsumerState<HomView> createState() => _HomViewState();
}

class _HomViewState extends ConsumerState<HomView> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const AllListingView(),
    const UserMessageView(),
    const UserNotificationView(),
    const UserDashboardView(),
  ];

  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.message_outlined,
    Icons.settings_outlined,
    Icons.person_outline
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ThemeConstant.backgroundColor,
      backgroundColor: ThemeConstant.primaryColor,
      onRefresh: () async {
        await ref.read(listingViewModelProvider.notifier).getAllListing();
      },
      child: Scaffold(
        body: lstBottomScreen[_selectedIndex],
        backgroundColor: ThemeConstant.backgroundColor,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.adBasicDetail);
          },
          child: const Icon(
            Icons.add,
            size: 36,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
            height: 55,
            activeColor: ThemeConstant.primaryColor,
            borderColor: const Color.fromARGB(255, 212, 210, 210),
            inactiveColor: const Color.fromARGB(255, 103, 102, 102),
            iconSize: 32,
            icons: iconList,
            activeIndex: _selectedIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
      ),
    );
  }
}
