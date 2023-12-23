import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdPhotoView extends ConsumerStatefulWidget {
  const AdPhotoView({super.key});

  @override
  ConsumerState<AdPhotoView> createState() => _AdPhotoViewState();
}

class _AdPhotoViewState extends ConsumerState<AdPhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listing photo'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("Listing photo"),
            )),
      ),
    );
  }
}
