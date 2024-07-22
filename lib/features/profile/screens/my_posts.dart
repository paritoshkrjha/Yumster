import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yumster/core/common/widget/back_button.dart';
import 'package:yumster/core/common/widget/loader.dart';
import 'package:yumster/core/common/widget/recipe_card.dart';
import 'package:yumster/data/providers/my_posts_provider.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/features/profile/profile_controller/profile_controller.dart';

class MyPostsScreen extends ConsumerStatefulWidget {
  const MyPostsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends ConsumerState<MyPostsScreen> {
  _handleDelete(String postId) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete Post'),
            content: const Text('Are you sure you want to delete this post?'),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                  ProfileController().deletePost(postId, ref);
                },
                child: const Text('Delete'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final userPosts = ref.watch(userProvider.select((user) => user.posts));
    final myPosts = ref.watch(myPostsProvider);
    if (userPosts.isEmpty) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: CustomBackButton(onBack: () => context.pop()),
            title: Text(
              'My Posts',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          body: const Center(
            child: Text('No posts yet'),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(onBack: () => context.pop()),
          title: Text(
            'My Posts',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        body: myPosts.isEmpty
            ? const CustomLoader(color: Colors.black)
            : ListView.builder(
                itemCount: myPosts.length,
                itemBuilder: (context, index) {
                  final post = myPosts[index];
                  return RecipeCard(
                    onRecipeView: () {},
                    recipe: post,
                    index: index,
                    onDelete: () => _handleDelete(post.id),
                    showDeleteButton: true,
                  );
                },
              ),
      ),
    );
  }
}
