import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ramrobazar_mobile_app/config/constants/theme_constant.dart';
import 'package:ramrobazar_mobile_app/features/auth/presentation/view/user/user_dashboard_view.dart';
import 'package:ramrobazar_mobile_app/features/auth/presentation/view/user/user_message_view.dart';
import 'package:ramrobazar_mobile_app/features/auth/presentation/view/user/user_notification_view.dart';
import 'package:ramrobazar_mobile_app/features/listing/presentation/view/general/view_all_listing.dart';

class HomView extends StatefulWidget {
  const HomView({super.key});

  @override
  State<HomView> createState() => _HomViewState();
}

class _HomViewState extends State<HomView> {
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
    Icons.notification_important_outlined,
    Icons.person_outline
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstant.backgroundColor,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
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
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
