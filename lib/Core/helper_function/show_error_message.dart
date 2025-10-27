import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      content: Text(
        message,
        style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 18,
        ),
      ),
    ),
  );
}
