import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/constants/constants.dart';
import 'package:yumster/data/providers/user_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void _navigateToMyPostsScreen() {
    context.pushNamed('myPosts');
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.12,
          child: Image.asset(Constants.kUserAvatarPath),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          user.username,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  user.posts.length.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  user.starredPosts.length.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Starred',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Divider(
          thickness: 1,
          height: 30,
          color: Colors.grey.shade300,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            onTap: _navigateToMyPostsScreen,
            leading: const Icon(Iconsax.grid_4),
            title: Text(
              'My posts',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
