import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/constants/constants.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/features/auth/controller/auth_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String greeting = '';
  String caption = '';

  getGreetings() {
    KTimeOfDay time;
    int hour = DateTime.now().hour;
    if (hour < 12) {
      time = KTimeOfDay.morning;
    } else if (hour >= 12 && hour < 17) {
      time = KTimeOfDay.afternoon;
    } else {
      time = KTimeOfDay.evening;
    }

    greeting = kGreetings[time]!.keys.first;
    List<String> captions = kGreetings[time]!.values.first;
    caption = captions[Random().nextInt(3)];
  }

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
  void initState() {
    super.initState();
    getGreetings();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Consumer(builder: (context, ref, child) {
                final user = ref.watch(userProvider);
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$greeting ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextSpan(
                        text: user.username,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      TextSpan(
                        text: ' !',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: ' $caption ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: Colors.grey.shade800,
                            ),
                      ),
                    ],
                  ),
                );
              }),
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
