import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/data/repository/profile_repository.dart';

final myPostsProvider =
    StateNotifierProvider<MyPostsNotifier, List<RecipeModel>>((ref) {
      final userPosts = ref.watch(userProvider.select((user) => user.posts));
  return MyPostsNotifier(userPosts);
});

class MyPostsNotifier extends StateNotifier<List<RecipeModel>> {
  final List<String> userPosts;
  MyPostsNotifier(this.userPosts) : super([]) {
    fetchRecipes();
  }

  fetchRecipes() async {
    try {
      String? token = await DeviceStorage().read(key: 'token');
      final posts = await ProfileRepository().getMyPosts(token!);
      state = posts;
    } catch (e) {
      print(e);
    }
  }
}