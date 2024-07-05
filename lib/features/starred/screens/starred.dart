import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarredScreen extends ConsumerStatefulWidget {
  const StarredScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StarredScreenState();
}

class _StarredScreenState extends ConsumerState<StarredScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Starred Screen'),
    );
  }
}
