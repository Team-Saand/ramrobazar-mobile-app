import 'package:flutter/material.dart';

showMessageToUser ({required BuildContext context, required String message, Color color = Colors.green}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(message)),
    duration: const Duration(seconds: 2),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
  ));
}
