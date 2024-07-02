import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int steps, active;
  const CustomStepper({super.key, required this.steps, required this.active});

  Widget _customStep(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 3,
      decoration: BoxDecoration(
        color: index < active ? Colors.blue : Colors.grey.shade400,
        borderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < steps; i++)
          Expanded(
            flex: 1,
            child: _customStep(i),
          ),
      ],
    );
  }
}
