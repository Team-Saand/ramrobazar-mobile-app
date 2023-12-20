import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotificationView extends ConsumerStatefulWidget {
  const UserNotificationView({super.key});

  @override
  ConsumerState<UserNotificationView> createState() => _UserNotificationViewState();
}

class _UserNotificationViewState extends ConsumerState<UserNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User notification'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("User notification"),
            )),
      ),
    );
  }
}
