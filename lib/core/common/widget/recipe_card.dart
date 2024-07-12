import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/providers/user_provider.dart';

class RecipeCard extends ConsumerStatefulWidget {
  final int index;
  final RecipeModel recipe;
  final Function() onLiked;
  final Function() onStarred;
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onLiked,
    required this.onStarred,
    required this.index,
  });

  @override
  ConsumerState<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends ConsumerState<RecipeCard> {
  Widget _recipeImg() {
    return Hero(
      tag: widget.index + 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: Image.asset(
            'assets/tempFood.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _clickToStarred() {
    return InkWell(
      onTap: widget.onStarred,
      child: const Icon(Iconsax.star),
    );
  }

  Widget _recipeDetailsAndClickToStarred(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.recipe.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 22,
                      ),
                ),
              ),
              _clickToStarred()
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Recipe by ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: widget.recipe.author['username'] ?? 'Author',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _clickToLike() {
    return InkWell(
      onTap: widget.onLiked,
      child: widget.recipe.likes.contains(ref.read(userProvider).id)
          ? const Icon(
              Icons.favorite_rounded,
              color: Palette.accentColor,
            )
          : const Icon(
              Icons.favorite_border_rounded,
            ),
    );
  }

  Widget _recipeLikesAndViewSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                _clickToLike(),
                const SizedBox(width: 5),
                Text(
                  widget.recipe.likes.length.toString(),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () {},
                  child: const Icon(Iconsax.eye),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.recipe.views.toString(),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(
                'viewRecipe',
                extra: widget.recipe,
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'View Recipe',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _recipeImg(),
          const SizedBox(height: 10),
          _recipeDetailsAndClickToStarred(context),
          const SizedBox(height: 10),
          _recipeLikesAndViewSection(context),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
