import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdBasicDetailView extends ConsumerStatefulWidget {
  const AdBasicDetailView({super.key});

  @override
  ConsumerState<AdBasicDetailView> createState() => _AdBasicDetailViewState();
}

class _AdBasicDetailViewState extends ConsumerState<AdBasicDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listing basic detail'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("Listing basic detail"),
            )),
      ),
    );
  }
}
