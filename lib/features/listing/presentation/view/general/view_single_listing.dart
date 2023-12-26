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
      body: SafeArea(
        child: SingleChildScrollView(
            child: Image.asset('assets/images/singleProduct.jpg')),
      ),
    );
  }
}
