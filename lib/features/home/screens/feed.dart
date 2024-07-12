import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/common/widget/recipe_card.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/providers/recipe_list_provider.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Your Feed',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
        ),
        // Consumer(
        //   builder: (context, ref, child) {
        //     UserModel user = ref.watch(userProvider);
        //     return Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Text(
        //         'Welcome, ${user.username}',
        //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        //               fontSize: 16,
        //             ),
        //       ),
        //     );
        //   },
        // ),
        Consumer(
          builder: (context, ref, child) {
            List<RecipeModel> recipes = ref.watch(recipeListProvider);
            return recipes.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          index: index,
                          recipe: recipes[index],
                          onStarred: () {},
                        );
                      },
                      itemCount: recipes.length,
                    ),
                  );
          },
        ),
      ],
    );
  }
}
