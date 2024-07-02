import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Utils {
  showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                context.pop();
              },
            )
          ],
        );
      },
    );
  }

  addDelay(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }
}
