import 'package:flutter/material.dart';

class ErrorSnackbar {
  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: kDefaultIconLightColor,
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Retry',
        textColor: Colors.white,
        onPressed: () {
          // Add your retry logic here
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}