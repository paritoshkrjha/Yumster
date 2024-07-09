import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/data/model/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final int index;
  final RecipeModel recipe;
  final Function() onLiked;
  final Function() onStarred;
  const RecipeCard({
    super.key,
    required this.onLiked,
    required this.onStarred,
    required this.recipe,
    required this.index,
  });

  Widget _recipeImg() {
    return Hero(
      tag: index + 1,
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

  Widget _clickToStarred(RecipeModel recipe) {
    return InkWell(
      onTap: onStarred,
      child: const Icon(Iconsax.star),
    );
  }

  Widget _recipeDetailsAndClickToStarred(
      BuildContext context, RecipeModel recipe) {
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
                  recipe.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 22,
                      ),
                ),
              ),
              _clickToStarred(recipe)
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
                  text: recipe.author['username'] ?? 'Author',
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

  Widget _clickToLike(RecipeModel recipe) {
    return InkWell(
        onTap: onLiked,
        child: recipe.likes.contains("6683cac4e62e111942e54311")
            ? const Icon(
                Icons.favorite_rounded,
                color: Palette.accentColor,
              )
            : const Icon(
                Icons.favorite_border_rounded,
              ));
  }

  Widget _recipeLikesAndViewSection(BuildContext context, RecipeModel recipe) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                _clickToLike(recipe),
                const SizedBox(width: 5),
                Text(
                  recipe.likes.length.toString(),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () {},
                  child: const Icon(Iconsax.eye),
                ),
                const SizedBox(width: 5),
                Text(
                  recipe.views.toString(),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => context
                .push('/view-recipe/:recipeId', extra: {'recipeId': recipe.id}),
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
          _recipeDetailsAndClickToStarred(context, recipe),
          const SizedBox(height: 10),
          _recipeLikesAndViewSection(context, recipe),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
