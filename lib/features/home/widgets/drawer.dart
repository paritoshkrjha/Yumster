import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/features/auth/controller/auth_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  _handleLogOut() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.pop(context);
                AuthController().handleLogOut(context);
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(top: 50),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Good Morning,',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  TextSpan(
                    text: 'User',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Iconsax.logout,
              color: Colors.grey.shade600,
            ),
            title: Text(
              'Log Out',
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
            onTap: _handleLogOut,
          ),
        ],
      ),
    );
  }
}
