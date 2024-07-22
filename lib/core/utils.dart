import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
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

  showConfirmationDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text(
                'Discard',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () {
                context.goNamed('home');
              },
            ),
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  addDelay(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    return null;
  }
}
