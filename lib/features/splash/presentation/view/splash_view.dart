import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/splash_view_model.dart';
import '../widget/info_view.dart';

class SplashScreenView extends ConsumerStatefulWidget {
  const SplashScreenView({super.key});

  @override
  ConsumerState<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends ConsumerState<SplashScreenView> {
  @override
  void initState() {
    delayHai();
    super.initState();
  }

  Future<void> delayHai() async {
    await Future.delayed(const Duration(seconds: 2), () {
      ref.read(splashViewModelProvider.notifier).init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const InfoView();
  }
}
