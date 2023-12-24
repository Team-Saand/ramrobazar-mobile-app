import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramrobazar_mobile_app/config/constants/theme_constant.dart';

class InfoView extends ConsumerStatefulWidget {
  const InfoView({super.key});

  @override
  ConsumerState<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends ConsumerState<InfoView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                tileMode: TileMode.clamp,
                begin: Alignment(-1.0, -0.5),
                end: Alignment(2, 2),
                colors: [
              ThemeConstant.primaryColor,
              Color.fromRGBO(255, 204, 106, 1),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              const Column(
                children: [
                  SizedBox(height: 90),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Ramrobazar    ',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  Row(
                    children: [
                      Text(
                        "     Every Product \n     Deserves a Second \n     Chance",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 355,
                    width: 200,
                  ),
                  Text('Version : 1.0.0')
                ],
              ),
              Positioned(
                bottom: 60,
                left: MediaQuery.of(context).size.width / 4,
                child: const Text(
                  '  Developed by: Team SAND',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
