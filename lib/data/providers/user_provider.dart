import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/constants/constants.dart';
import 'package:yumster/data/model/user_model.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier()
      : super(
          UserModel(
            id: '',
            avatarUrl: Constants.kUserAvatarPath,
            email: '',
            username: '',
            posts: [],
            preferences: [],
            starredPosts: [],
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

  void updateUser(UserModel user) {
    state = user;
  }

  void updateStarredPosts(List<String> starredPosts) {
    state = state.copyWith(starredPosts: starredPosts);
  }

  void updatePosts(List<String> posts) {
    state = state.copyWith(posts: posts);
  }
}
