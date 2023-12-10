import 'package:flutter/material.dart';
import 'package:ramrobazar_mobile_app/LandingPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Ramrobazar',
    theme: ThemeData(
      
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 184, 178, 177)),
      scaffoldBackgroundColor: const Color.fromARGB(255, 136, 187, 229),
      textTheme: TextTheme()
    ),
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const LandingPage(),
    },
  ));
}
