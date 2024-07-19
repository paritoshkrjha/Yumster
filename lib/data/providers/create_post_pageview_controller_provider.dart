import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPostPageViewControllerProvider = Provider<PageController>((ref) {
  return PageController();
});
