import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/data/model/user_model.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier()
      : super(
          UserModel(
            avatarUrl: '',
            email: '',
            name: '',
            password: '',
            posts: [],
            preferences: [],
            savedPosts: [],
          ),
        );

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
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

  void updateUser(UserModel user) {
    state = user;
  }
}
