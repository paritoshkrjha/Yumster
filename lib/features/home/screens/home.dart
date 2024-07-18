import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/data/providers/navbar_index_provider.dart';
import 'package:yumster/features/home/screens/feed.dart';
import 'package:yumster/features/home/widgets/bottom_navigation_bar.dart';
import 'package:yumster/features/home/widgets/drawer.dart';
import 'package:yumster/features/profile/screens/profile.dart';
import 'package:yumster/features/starred/screens/starred.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedPageIndex = ref.watch(navbarIndexProvider);
    final seletedPage = kHomeScreen[selectedPageIndex];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            kHomeScreenTitle[selectedPageIndex]!,
            style: selectedPageIndex == 0
                ? GoogleFonts.dancingScript().copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )
                : const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
          ),
          centerTitle: selectedPageIndex == 0,
        ),
        drawer: const CustomDrawer(),
        body: seletedPage,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        floatingActionButton: selectedPageIndex == 0
            ? FloatingActionButton(
                backgroundColor: Palette.accentColor,
                foregroundColor: Colors.white,
                onPressed: () {
                  context.goNamed('create');
                },
                child: const Icon(Icons.add),
              )
            : null,
      ),
    );
  }
}

Map<int, dynamic> kHomeScreen = {
  0: const HomeFeed(),
  1: const StarredScreen(),
  2: const ProfileScreen(),
};

Map<int, String> kHomeScreenTitle = {
  0: 'Yumster',
  1: 'Starred',
  2: 'Profile',
};
