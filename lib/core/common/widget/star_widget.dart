import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/model/user_model.dart';
import 'package:yumster/data/providers/recipe_list_provider.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/features/home/feed_controller.dart';

class StarWidget extends ConsumerWidget {
  final int index;
  const StarWidget({required this.index, super.key});
  _handleStar(WidgetRef ref, String postId) {
    FeedController().starPost(postId, ref);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel user = ref.watch(userProvider);
    List<RecipeModel> recipeList = ref.watch(recipeListProvider);
    final recipe = recipeList[index];

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () => _handleStar(ref, recipe.id),
      child: user.starredPosts.contains(recipe.id)
          ? const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 217, 45),
              child: Icon(
                Icons.star_rounded,
                size: 30,
                color: Colors.white,
              ),
            )
          : const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Iconsax.star),
            ),
    );
  }
}
