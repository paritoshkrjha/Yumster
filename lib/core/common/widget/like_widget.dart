import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/providers/recipe_list_provider.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/features/home/feed_controller.dart';

class LikeWidget extends ConsumerWidget {
  final int index;
  const LikeWidget({required this.index, super.key});

  _handleLike(WidgetRef ref, String postId) {
    FeedController().likePost(postId, ref);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<RecipeModel> recipeList = ref.watch(recipeListProvider);
    final recipe = recipeList[index];
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () => _handleLike(ref, recipe.id),
      child: recipe.likes.contains(ref.read(userProvider).id)
          ? const CircleAvatar(
              backgroundColor: Palette.accentColor,
              child: Icon(
                Iconsax.heart5,
                color: Colors.white,
              ),
            )
          : const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Iconsax.heart),
            ),
    );
  }
}
