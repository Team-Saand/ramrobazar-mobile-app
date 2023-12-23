import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateListingView extends ConsumerStatefulWidget {
  const UpdateListingView({super.key});

  @override
  ConsumerState<UpdateListingView> createState() => _UpdateListingViewState();
}

class _UpdateListingViewState extends ConsumerState<UpdateListingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Listing '),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("Update listing"),
            )),
      ),
    );
  }
}
