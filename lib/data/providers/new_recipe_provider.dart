import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/data/model/new_recipe.dart';

final newRecipeProvider =
    StateNotifierProvider<NewRecipeNotifier, NewRecipeModel>((ref) {
  return NewRecipeNotifier();
});

class NewRecipeNotifier extends StateNotifier<NewRecipeModel> {
  NewRecipeNotifier() : super(NewRecipeModel(
    title: '' ,
    description: '',
    steps: [],
    ingredients: [],
    duration: 0,
    imageUrl: 'assets/tempFood.jpg',
    mealType: '',
    veg: true,
    tags: [],
  ));

  void updateRecipe(NewRecipeModel recipe) {
    state = recipe;
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updateIngredients(List<String> ingredients) {
    state = state.copyWith(ingredients: ingredients);
  }

  void updateSteps(List<String> steps) {
    state = state.copyWith(steps: steps);
  }

  void updateDuration(int duration) {
    state = state.copyWith(duration: duration);
  }

  void updateImageUrl(String imageUrl) {
    state = state.copyWith(imageUrl: imageUrl);
  }

  void updateTags(List<String> tags) {
    state = state.copyWith(tags: tags);
  }

  void updateMealType(String mealType) {
    state = state.copyWith(mealType: mealType);
  }

  void updateVeg(bool veg) {
    state = state.copyWith(veg: veg);
  }
}
