import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/router/app_route.dart';
import '../snackbar/snackbar_message.dart';
import 'internet_connectivity.dart';

class InternetCheck extends ConsumerStatefulWidget {
  const InternetCheck({super.key});

  @override
  ConsumerState<InternetCheck> createState() => _InternetCheckState();
}

class _InternetCheckState extends ConsumerState<InternetCheck> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final connectivityStatus = ref.watch(connectivityStatusProvider);
            try {
              if (connectivityStatus == ConnectivityStatus.isConnected) {
                return showMessageToUser(
                    context: context, message: 'Connected to Internet');
              } else {
                return showMessageToUser(
                    context: context,
                    message: 'Disconnected from the Internet',
                    color: Colors.red);
              }
            } catch (e) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.red,
                    title: const Text(
                      "GOOOOOOOOOOO BACK",
                      style: TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                  ),
                  body: SingleChildScrollView(
                    child: SafeArea(
                      child: Center(
                        child: Column(children: [
                          SizedBox(height: screenSize.height * 0.05),
                          const Text(
                            'AHHHHHHHHHHHHHHHHHHHHHHHH!  \n Your not supposed to see this!!!!! ',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.05),
                          Container(
                            height: screenSize.height * 0.6,
                            width: screenSize.width,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/goback.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.05),
                          SizedBox(
                            width: screenSize.width,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, AppRoute.splashRoute);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.red,
                                        backgroundColor: Colors.red,
                                      ),
                                      child: const Text(
                                        'GO BACK',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ]),
                      ),
                    ),
                  ));
            }
          },
        ),
      ),
    );
  }
}
