import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/data/providers/create_post_pageview_controller_provider.dart';
import 'package:yumster/data/providers/new_recipe_provider.dart';
import 'package:yumster/data/providers/stepper_provider.dart';

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
    required WidgetRef ref,
  }) {
    ref.read(createPostPageViewControllerProvider).nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    ref.read(stepperProvider.notifier).state++;
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
}
