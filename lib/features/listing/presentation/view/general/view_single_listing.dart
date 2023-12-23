import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleListingView extends ConsumerStatefulWidget {
  const SingleListingView({super.key});

  @override
  ConsumerState<SingleListingView> createState() => _SingleListingViewState();
}

class _SingleListingViewState extends ConsumerState<SingleListingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singlelisting'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("single listing"),
            )),
      ),
    );
  }
}
