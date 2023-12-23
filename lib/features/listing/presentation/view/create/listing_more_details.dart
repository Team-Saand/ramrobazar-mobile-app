import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdMoreDetailView extends ConsumerStatefulWidget {
  const AdMoreDetailView({super.key});

  @override
  ConsumerState<AdMoreDetailView> createState() => _AdMoreDetailViewState();
}

class _AdMoreDetailViewState extends ConsumerState<AdMoreDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("More details"),
            )),
      ),
    );
  }
}
