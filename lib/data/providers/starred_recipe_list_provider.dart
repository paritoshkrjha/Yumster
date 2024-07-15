import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/data/repository/feed_repository.dart';

final starredListProvider =
    StateNotifierProvider<StarredListNotifier, List<RecipeModel>?>(
  (ref) {
    final user = ref.watch(userProvider.select((user) => user.starredPosts));
    return StarredListNotifier(user);
  },
);

class StarredListNotifier extends StateNotifier<List<RecipeModel>?> {
  final List<String>? starredPosts;
  StarredListNotifier(this.starredPosts) : super(null) {
    fecthStarredList();
  }

  void fecthStarredList() async {
    try {
      String? token = await DeviceStorage().read(key: 'token');
      final recipeList = await FeedRepository().getStarredPosts(token!);
      state = recipeList;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
