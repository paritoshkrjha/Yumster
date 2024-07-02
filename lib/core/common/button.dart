import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
