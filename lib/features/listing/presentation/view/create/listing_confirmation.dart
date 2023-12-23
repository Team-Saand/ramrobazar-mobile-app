import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdConfirmationView extends ConsumerStatefulWidget {
  const AdConfirmationView({super.key});

  @override
  ConsumerState<AdConfirmationView> createState() => _AdConfirmationViewState();
}

class _AdConfirmationViewState extends ConsumerState<AdConfirmationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listing confirmation'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("Listing confirmation"),
            )),
      ),
    );
  }
}
