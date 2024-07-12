import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/data/providers/recipe_list_provider.dart';
import 'package:yumster/data/repository/feed_repository.dart';

class FeedController {
  void likePost(String postId, WidgetRef ref) async {
    String? token = await DeviceStorage().read(key: 'token');
    if (token != null) {
      final response = await FeedRepository().likePost(postId, token);
      response.fold(
        // ignore: avoid_print
        (failure) => print(failure.message),
        (recipe) {
          //update the recipe list with the new recipe
          ref.read(recipeListProvider.notifier).updateRecipe(recipe);
        },
      );
    }
  }

  void updateViewCount(String postId, WidgetRef ref) async {
    String? token = await DeviceStorage().read(key: 'token');
    if (token != null) {
      final response = await FeedRepository().updateViewCount(postId, token);
      response.fold(
        // ignore: avoid_print
        (failure) => print(failure.message),
        (recipe) {
          //update the recipe list with the new recipe
          ref.read(recipeListProvider.notifier).updateRecipe(recipe);
        },
      );
    }
  }
}
