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
      appBar: AppBar(
        title: const Text('User Message'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("User Message"),
            )),
      ),
    );
  }
}
