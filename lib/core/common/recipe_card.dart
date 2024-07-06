import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RecipeCard extends StatelessWidget {
  final Function() onLiked;
  final Function() onStarred;
  const RecipeCard({super.key, required this.onLiked, required this.onStarred});

  Widget _recipeImg() {
    return Hero(
      tag: 'recipeImage', //TODO: Add unique tag
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
      onTap: onStarred,
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
                  'Recipe Name ',
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
                  text: 'Author',
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
      onTap: onLiked,
      child: const Icon(Iconsax.heart),
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
                const Text(
                  '100',
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () {},
                  child: const Icon(Iconsax.eye),
                ),
                const SizedBox(width: 5),
                const Text(
                  '100',
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
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
