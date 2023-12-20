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
      appBar: AppBar(
        title: const Text('User Dashboard'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("User Dashboard"),
            )),
      ),
    );
  }
}
