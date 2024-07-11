import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:yumster/data/providers/new_user_provider.dart';
import 'package:yumster/data/providers/page_view_controller_provider.dart';
import 'package:yumster/data/providers/stepper_provider.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/data/repository/auth_repository.dart';

class AuthController {
  //login controller method
  handleLogin({
    required String email,
    required String password,
    required WidgetRef ref,
    required Function() onLoginSuccess,
    required Function() onLoginFailure,
  }) async {
    final response =
        await AuthRepository().login(email: email, password: password);

    response.fold(
      (l) {
        onLoginFailure();
        Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
        );
      },
      (r) {
        ref.read(userProvider.notifier).updateUser(r!);
        onLoginSuccess();
        Fluttertoast.showToast(
          msg: 'Login successful!',
          toastLength: Toast.LENGTH_SHORT,
        );
      },
    );
  }

  //signup controller method
  bool validateForm({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  handleNext({
    required WidgetRef ref,
    required String username,
    required String email,
    required String password,
  }) {
    ref.read(pageViewControllerProvider).nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    ref.read(stepperProvider.notifier).state++;
    ref.read(newUserProvider.notifier).updateEmail(email);
    ref.read(newUserProvider.notifier).updateName(username);
    ref.read(newUserProvider.notifier).updatePassword(password);
  }

  handleBack(WidgetRef ref) {
    ref.read(pageViewControllerProvider).previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
    ref.read(stepperProvider.notifier).state--;
  }

  handleSignUp({
    required List<String> preferences,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    ref.read(newUserProvider.notifier).updatePreferences(preferences);
    final newUser = ref.read(newUserProvider);
    final response = await AuthRepository().signUp(newUser);
    response.fold((l) => handleSignUpError(context, l.message), (r) {
      ref.read(userProvider.notifier).updateUser(r!);
      handleSignUpSuccess(context, ref);
    });
  }

  handleSignUpError(BuildContext context, String message) {
    context.goNamed('getStarted');
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
    return false;
  }

  handleSignUpSuccess(BuildContext context, WidgetRef ref) {
    context.go('/home');
    Fluttertoast.showToast(
      msg: 'Signup successful!',
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  handleLogOut(BuildContext context) async {
    final response = await AuthRepository().handleLogOut();

    response.fold(
      (l) => Fluttertoast.showToast(
        msg: l.message,
        toastLength: Toast.LENGTH_SHORT,
      ),
      (r) {
        context.goNamed('getStarted');
        Fluttertoast.showToast(
          msg: 'Logged out successfully!',
          toastLength: Toast.LENGTH_SHORT,
        );
      },
    );
  }
}
