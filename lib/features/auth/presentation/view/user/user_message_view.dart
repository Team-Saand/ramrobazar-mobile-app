import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserMessageView extends ConsumerStatefulWidget {
  const UserMessageView({super.key});

  @override
  ConsumerState<UserMessageView> createState() => _UserMessageViewState();
}

class _UserMessageViewState extends ConsumerState<UserMessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: SafeArea(
        child: SingleChildScrollView(
            child: Image.asset('assets/images/messages.jpg')),
      ),
    );
  }
}
