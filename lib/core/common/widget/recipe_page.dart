import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/common/widget/like_widget.dart';
import 'package:yumster/core/common/widget/star_widget.dart';
import 'package:yumster/data/model/recipe_model.dart';

class RecipePageWidget extends ConsumerStatefulWidget {
  final int index;
  final RecipeModel recipe;
  final Function() onRecipeView;
  const RecipePageWidget({
    required this.onRecipeView,
    super.key,
    required this.recipe,
    required this.index,
  });

  @override
  ConsumerState<RecipePageWidget> createState() => _RecipePageWidgetState();
}

class _RecipePageWidgetState extends ConsumerState<RecipePageWidget> {
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
          height: MediaQuery.of(context).size.height * 0.4,
          child: Image.asset(
            'assets/tempFood.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _recipeDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
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
              StarWidget(index: widget.index)
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

  Widget _recipeLikesAndViewSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                LikeWidget(index: widget.index),
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
                pathParameters: {
                  'index': widget.index.toString(),
                },
                extra: widget.recipe,
              );
              //make call for view count updation
              widget.onRecipeView();
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

  Widget _recipeTags(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 5,
        children: List.generate(
          widget.recipe.tags.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Text('#${widget.recipe.tags[index]}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.blue.shade700)),
            );
          },
        ),
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
          _recipeDescription(context),
          const SizedBox(height: 10),
          _recipeLikesAndViewSection(context),
          const SizedBox(height: 10),
          _recipeTags(context),
        ],
      ),
    );
  }
}
