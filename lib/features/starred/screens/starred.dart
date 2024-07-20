import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/common/widget/loader.dart';
import 'package:yumster/core/common/widget/recipe_card.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/providers/starred_recipe_list_provider.dart';

class StarredScreen extends ConsumerStatefulWidget {
  const StarredScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StarredScreenState();
}

class _StarredScreenState extends ConsumerState<StarredScreen> {
  @override
  Widget build(BuildContext context) {
    List<RecipeModel>? starredList = ref.watch(starredListProvider);
    if (starredList == null) {
      return const CustomLoader(
        color: Colors.black,
      );
    }
    return starredList.isEmpty
        ? const Center(
            child: Text('No starred recipes'),
          )
        : ListView.builder(
            itemCount: starredList.length,
            itemBuilder: (context, index) {
              RecipeModel recipe = starredList[index];
              return RecipeCard(
                onRecipeView: () {},
                recipe: recipe,
                index: index,
              );
            });
  }
}
