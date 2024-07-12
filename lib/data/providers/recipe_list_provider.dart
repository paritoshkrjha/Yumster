import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/repository/feed_repository.dart';

final recipeListProvider =
    StateNotifierProvider<RecipeListNotifier, List<RecipeModel>>((ref) {
  return RecipeListNotifier();
});

class RecipeListNotifier extends StateNotifier<List<RecipeModel>> {
  RecipeListNotifier() : super([]) {
    fetchRecipes();
  }

  fetchRecipes() async {
    try {
      String? token = await DeviceStorage().read(key: 'token');
      final recipeList = await FeedRepository().getRecipePosts(token!);
      state = recipeList;
    } catch (e) {
      print(e);
    }
  }

  void updateRecipe(RecipeModel updatedRecipe) {
    state = state.map((recipe) {
      return recipe.id == updatedRecipe.id ? updatedRecipe : recipe;
    }).toList();
  }
}
