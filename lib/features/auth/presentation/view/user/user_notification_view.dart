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
      
     body: SafeArea(
        child: SingleChildScrollView(
            child: Image.asset('assets/images/settings.jpg')),
      ),
    );
  }
}
