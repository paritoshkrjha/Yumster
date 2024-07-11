import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/common/widget/loader.dart';
import 'package:yumster/core/constants/screen_constants.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/features/auth/controller/auth_controller.dart';

class PersonalDetailsScreen extends ConsumerStatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  ConsumerState<PersonalDetailsScreen> createState() =>
      _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends ConsumerState<PersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _userName = '';
  bool _isObscure = true;
  bool _isLoading = false;

  _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  _handleNext(WidgetRef ref) async {
    FocusScope.of(context).unfocus();
    final validate = AuthController().validateForm(formKey: _formKey);
    if (!validate) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

    AuthController().handleNext(
      email: _email,
      password: _password,
      username: _userName,
      ref: ref,
    );
  }

  getInitialValues() {
    _email = ref.read(userProvider).email;
    _password = ref.read(userProvider).password;
    _userName = ref.read(userProvider).username;
  }

  @override
  void initState() {
    super.initState();
    getInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ScreenConstants.personalDetailsScreenConstants['title']!,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            ScreenConstants.personalDetailsScreenConstants['subtitle']!,
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ScreenConstants
                          .personalDetailsScreenConstants['usernameLabel']!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: Colors.black87,
                      initialValue: _userName,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.user),
                        hintText: ScreenConstants
                            .personalDetailsScreenConstants['usernameHint']!,
                      ),
                      validator: (newValue) {
                        if (newValue!.isEmpty) {
                          return ScreenConstants.personalDetailsScreenConstants[
                              'usernameValidation']!;
                        }
                        return null;
                      },
                      onSaved: (newValue) => {
                        _userName = newValue!,
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ScreenConstants
                          .personalDetailsScreenConstants['emailLabel']!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: Colors.black87,
                      initialValue: _email,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.sms),
                        hintText: ScreenConstants
                            .personalDetailsScreenConstants['emailHint']!,
                      ),
                      validator: (newValue) {
                        if (newValue!.isEmpty) {
                          return ScreenConstants.personalDetailsScreenConstants[
                              'emailValidation']!;
                        }
                        return null;
                      },
                      onSaved: (newValue) => {
                        _email = newValue!,
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ScreenConstants
                          .personalDetailsScreenConstants['passwordLabel']!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: Colors.black87,
                      initialValue: _password,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.lock_1),
                        suffixIcon: InkWell(
                          onTap: _togglePasswordVisibility,
                          child: Icon(
                            !_isObscure ? Iconsax.eye_slash : Iconsax.eye,
                          ),
                        ),
                        hintText: ScreenConstants
                            .personalDetailsScreenConstants['passwordHint']!,
                      ),
                      obscureText: _isObscure,
                      validator: (newValue) {
                        if (newValue!.isEmpty) {
                          return ScreenConstants.personalDetailsScreenConstants[
                              'passwordValidation']!;
                        }
                        return null;
                      },
                      onSaved: (newValue) => {
                        _password = newValue!,
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!,
            onPressed: () => _handleNext(ref),
            child: _isLoading
                ? const CustomLoader()
                : Text(
                    ScreenConstants
                        .personalDetailsScreenConstants['buttonText']!,
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  height: 2,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('OR'),
              ),
              Expanded(
                child: Divider(
                  height: 2,
                  thickness: 1,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ScreenConstants
                    .personalDetailsScreenConstants['signInhelpText']!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () => context.goNamed('login'),
                child: Text(
                  ScreenConstants.personalDetailsScreenConstants['signInCta']!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Palette.accentColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
