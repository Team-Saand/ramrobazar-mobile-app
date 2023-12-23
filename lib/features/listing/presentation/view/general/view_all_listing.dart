import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllListingView extends ConsumerStatefulWidget {
  const AllListingView({super.key});

  @override
  ConsumerState<AllListingView> createState() => _AllListingViewState();
}

class _AllListingViewState extends ConsumerState<AllListingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View all ads'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("Adssssss"),
            )),
      ),
    );
  }
}
