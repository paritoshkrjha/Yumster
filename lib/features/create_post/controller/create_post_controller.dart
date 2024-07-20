import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/data/providers/create_post_pageview_controller_provider.dart';
import 'package:yumster/data/providers/new_recipe_provider.dart';
import 'package:yumster/data/providers/recipe_image_provider.dart';
import 'package:yumster/data/providers/stepper_provider.dart';
import 'package:yumster/data/repository/create_post_repository.dart';

class CreatePostController {
  bool validateForm({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  void handleSaveBasicDetails({
    required String recipeName,
    required String recipeDescription,
    required Uint8List recipeImage,
    required WidgetRef ref,
  }) {
    ref.read(createPostPageViewControllerProvider).nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    ref.read(stepperProvider.notifier).state++;
    ref.read(recipeImageProvider.notifier).state = recipeImage;
    ref.read(newRecipeProvider.notifier).updateTitle(recipeName);
    ref.read(newRecipeProvider.notifier).updateDescription(recipeDescription);
  }

  handleBack(WidgetRef ref) {
    ref.read(createPostPageViewControllerProvider).previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    ref.read(stepperProvider.notifier).state--;
  }

  void handleSaveIngredients(
      {required List<String> ingredients, required WidgetRef ref}) {
    ref.read(createPostPageViewControllerProvider).nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    ref.read(stepperProvider.notifier).state++;
    ref.read(newRecipeProvider.notifier).updateIngredients(ingredients);
  }

  void handleSaveSteps({required List<String> steps, required WidgetRef ref}) {
    ref.read(createPostPageViewControllerProvider).nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    ref.read(stepperProvider.notifier).state++;
    ref.read(newRecipeProvider.notifier).updateSteps(steps);
  }

  void handlePostRecipe({
    String? mealType,
    required bool isVeg,
    required bool isGlutenFree,
    required bool isVegan,
    required bool isDairyFree,
    required String cuisineType,
    required int duration,
    required Function onFailure,
    required Function onSuccess,
    required WidgetRef ref,
  }) async {
    ref.read(newRecipeProvider.notifier).updateDuration(duration);
    ref.read(newRecipeProvider.notifier).updateMealType(mealType!);
    ref.read(newRecipeProvider.notifier).updateVeg(isVeg);
    List<String> tags = [];
    tags.add(cuisineType);
    if (isVegan) {
      tags.add('vegan');
    }
    if (isGlutenFree) {
      tags.add('gluten-free');
    }
    if (isDairyFree) {
      tags.add('dairy-free');
    }
    ref.read(newRecipeProvider.notifier).updateTags(tags);
    String? token = await DeviceStorage().read(key: 'token');
    final response = await CreatePostRepository().createPost(
      ref.read(newRecipeProvider),
      token!,
    );
    response.fold((left) => onFailure(left.message), (user) => onSuccess(user));
  }
}
