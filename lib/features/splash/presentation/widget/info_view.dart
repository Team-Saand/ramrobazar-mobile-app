import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoView extends ConsumerStatefulWidget {
  const InfoView({super.key});

  @override
  ConsumerState<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends ConsumerState<InfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/orange-icon.png')),
                Text(
                  'Ramrobazar',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Every item deserves a second chance",
                ),
                 SizedBox(
                  height: 30,
                  width: 200,
                ),
                SizedBox(height: 10),
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text('version : 1.0.0')
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: MediaQuery.of(context).size.width / 4,
            child: const Text(
              'Developed by: Team SAND',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
