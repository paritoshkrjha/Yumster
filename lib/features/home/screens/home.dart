import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yumster/features/auth/controller/auth_controller.dart';
import 'package:yumster/features/home/widgets/bottom_navigation_bar.dart';
import 'package:yumster/features/home/widgets/drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  _handleLogOut() {
    AuthController().handleLogOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Yumster',
            style: GoogleFonts.dancingScript().copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: const Placeholder(),
        bottomNavigationBar: const CustomBottomNavigationBar());
  }
}
