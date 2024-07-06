import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/common/recipe_card.dart';

class HomeFeed extends ConsumerStatefulWidget {
  const HomeFeed({super.key});

  @override
  ConsumerState<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends ConsumerState<HomeFeed> {
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return RecipeCard(
                onLiked: () {},
                onStarred: () {},
              );
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
