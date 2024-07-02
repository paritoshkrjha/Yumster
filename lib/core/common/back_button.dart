import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBackButton extends StatelessWidget {
  final Function() onBack;
  const CustomBackButton({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Iconsax.arrow_left_2),
      onPressed: onBack
    );
  }
}
