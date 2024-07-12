import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/common/widget/back_button.dart';
import 'package:yumster/core/common/widget/like_widget.dart';
import 'package:yumster/core/constants/constants.dart';
import 'package:yumster/data/model/recipe_model.dart';

class ViewRecipeScreen extends StatefulWidget {
  final int index;
  final RecipeModel recipe;
  const ViewRecipeScreen(
      {super.key, required this.recipe, required this.index});

  @override
  State<ViewRecipeScreen> createState() => _ViewRecipeScreenState();
}

class _ViewRecipeScreenState extends State<ViewRecipeScreen> {
  bool isInstructionSelected = true; //The default is Instruction

  void handleInstructionToggle() {
    setState(() {
      isInstructionSelected = !isInstructionSelected;
    });
  }

  Widget _recipeTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        widget.recipe.title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
      ),
    );
  }

  Widget _recipeAuthorAndRatingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              Image.asset(
                Constants.kUserAvatarPath,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.recipe.author['username']!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              LikeWidget(index: widget.index),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: widget.recipe.likes.contains("6683cac4e62e111942e54311")
                    ? const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 208, 0),
                        child: Icon(
                          Icons.star_rounded,
                          color: Colors.white,
                        ),
                      )
                    : const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(Iconsax.star),
                      ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recipeQuickInfoWidget() {
    Color color = widget.recipe.veg ? Colors.green : Colors.red;
    String label = widget.recipe.veg ? "Vegetarian" : "Non-veg";
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  "assets/timer.png",
                  height: 40,
                ),
              ),
              Text(
                " ${widget.recipe.duration} Min",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: color, width: 2)),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: color,
                  ),
                ),
              ),
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  "assets/dish_steps.png",
                  height: 50,
                ),
              ),
              Text(
                " ${widget.recipe.steps.length} Steps",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _recipeDescriptionWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.recipe.description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _instructionsAndIngredientTabWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white),
      child: InkWell(
        onTap: handleInstructionToggle,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isInstructionSelected
                      ? Colors.grey.shade100
                      : Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Text(
                  'Instructions',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: !isInstructionSelected
                      ? Colors.grey.shade100
                      : Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Ingredients',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _instructionAndIngredientWidget() {
    List<String> list =
        isInstructionSelected ? widget.recipe.steps : widget.recipe.ingredients;
    int index = 1;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list
            .map((item) => Text(
                  '${index++}. $item',
                  style: Theme.of(context).textTheme.bodyMedium,
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                leading: CustomBackButton(
                  onBack: () => context.pop(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/tempFood.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _recipeTitleWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  _recipeAuthorAndRatingWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  _recipeQuickInfoWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  _recipeDescriptionWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  _instructionsAndIngredientTabWidget(),
                  const SizedBox(
                    height: 5,
                  ),
                  _instructionAndIngredientWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
