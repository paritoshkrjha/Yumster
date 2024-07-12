import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  final Color color;
  const CustomLoader({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: color,
      size: 24,
      lineWidth: 2,
    );
  }
}
