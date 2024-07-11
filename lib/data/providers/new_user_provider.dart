import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/data/model/new_user.dart';

final newUserProvider = StateNotifierProvider<NewUserNotifier, NewUserModel>((ref) {
  return NewUserNotifier();
});


class NewUserNotifier extends StateNotifier<NewUserModel> {
  NewUserNotifier() : super(
    NewUserModel(
      email: '',
      password: '',
      username: '',
      avatarUrl: '',
      preferences: [],
    ),
  );

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateName(String name) {
    state = state.copyWith(username: name);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }
  
  void updateAvatarUrl(String avatarUrl) {
    state = state.copyWith(avatarUrl: avatarUrl);
  }

  void updatePreferences(List<String> preferences) {
    state = state.copyWith(preferences: preferences);
  }
}