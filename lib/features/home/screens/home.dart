import 'package:flutter/material.dart';
import 'package:yumster/features/auth/controller/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _handleLogOut() {
    AuthController().handleLogOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _handleLogOut,
          child: const Text('Log out'),
        ),
      ),
    );
  }
}
