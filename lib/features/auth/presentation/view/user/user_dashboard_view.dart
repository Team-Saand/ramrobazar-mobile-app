import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDashboardView extends ConsumerStatefulWidget {
  const UserDashboardView({super.key});

  @override
  ConsumerState<UserDashboardView> createState() => _UserDashboardViewState();
}

class _UserDashboardViewState extends ConsumerState<UserDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Image.asset('assets/images/profile.jpg')),
      ),
    );
  }
}
