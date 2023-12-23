import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdPriceView extends ConsumerStatefulWidget {
  const AdPriceView({super.key});

  @override
  ConsumerState<AdPriceView> createState() => _AdPriceViewState();
}

class _AdPriceViewState extends ConsumerState<AdPriceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listing price'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text("Listing price"),
            )),
      ),
    );
  }
}
