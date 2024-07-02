import 'package:flutter_riverpod/flutter_riverpod.dart';

final userLoggedInStatusProvider = StateProvider<bool>((ref) {
  return false;
});