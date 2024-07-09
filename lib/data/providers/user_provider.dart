import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/constants/constants.dart';
import 'package:yumster/data/model/user_model.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier()
      : super(
          UserModel(
            avatar: Constants.kUserAvatarPath,
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
  
  void updateAvatarUrl(String avatar) {
    state = state.copyWith(avatar: avatar);
  }

  void updatePreferences(List<String> preferences) {
    state = state.copyWith(preferences: preferences);
  }

  void updateUser(UserModel user) {
    state = user;
  }
}
