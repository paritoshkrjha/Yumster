import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/data/providers/navbar_index_provider.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends ConsumerState<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: ref.watch(NavbarIndexProvider),
      onItemSelected: (value) {
        ref.read(NavbarIndexProvider.notifier).state = value;
      },
      items: [
        FlashyTabBarItem(
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          icon: const Icon(
            Iconsax.home,
          ),
          title: const Text('Home'),
        ),
        FlashyTabBarItem(
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          icon: const Icon(
            Icons.star_outline_rounded,
            size: 26,
          ),
          title: const Text('Starred'),
        ),
        FlashyTabBarItem(
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          icon: const Icon(
            Iconsax.user,
          ),
          title: const Text('Profile'),
        ),
      ],
    );
  }
}
