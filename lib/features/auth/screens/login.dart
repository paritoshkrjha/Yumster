import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/common/back_button.dart';
import 'package:yumster/core/common/loader.dart';
import 'package:yumster/core/constants/screen_constants.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/core/utils.dart';
import 'package:yumster/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool isLoading = false;
  var _enteredEmail = '';
  var _enteredPassword = '';

  handleLogin() async {
    FocusScope.of(context).unfocus();
    final validate = _formKey.currentState!.validate();
    if (!validate) {
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      isLoading = true;
    });
    await Utils().addDelay(2);
    AuthController().handleLogin(
      email: _enteredEmail,
      password: _enteredPassword,
      ref: ref,
      onLoginSuccess: () => context.goNamed('home'),
      onLoginFailure: () => context.goNamed('login'),
    );

    setState(() {
      isLoading = false;
    });
  }

  _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(
            onBack: () => context.goNamed('getStarted'),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Text(
                    '${ScreenConstants.signInScreenConstants['title']!}👋',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(ScreenConstants.signInScreenConstants['subtitle']!,
                      style: Theme.of(context).textTheme.bodyLarge!),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ScreenConstants.signInScreenConstants['emailLabel']!,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          cursorColor: Colors.black87,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.sms),
                            hintText: ScreenConstants
                                .signInScreenConstants['emailHint']!,
                            enabled: !isLoading,
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          validator: (newValue) {
                            if (newValue!.isEmpty) {
                              return ScreenConstants
                                  .signInScreenConstants['emailValidation']!;
                            }
                            return null;
                          },
                          onSaved: (newValue) => _enteredEmail = newValue!,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          ScreenConstants
                              .signInScreenConstants['passwordLabel']!,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          cursorColor: Colors.black87,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.lock_1),
                            suffixIcon: InkWell(
                              onTap: _togglePasswordVisibility,
                              child: Icon(
                                !_isObscure ? Iconsax.eye_slash : Iconsax.eye,
                              ),
                            ),
                            hintText: ScreenConstants
                                .signInScreenConstants['passwordHint']!,
                            enabled: !isLoading,
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          obscureText: _isObscure,
                          validator: (value) {
                            if (value!.isEmpty || value.trim().isEmpty) {
                              return ScreenConstants
                                  .signInScreenConstants['passwordValidation']!;
                            }
                            return null;
                          },
                          onSaved: (newValue) => _enteredPassword = newValue!,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor: const WidgetStatePropertyAll(
                                  Palette.accentColor,
                                ),
                              ),
                          onPressed: handleLogin,
                          child: isLoading
                              ? const CustomLoader()
                              : Text(
                                  ScreenConstants
                                      .signInScreenConstants['buttonText']!,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Text(
                          ScreenConstants
                              .signInScreenConstants['signUphelpText']!,
                          style: Theme.of(context).textTheme.bodyMedium!,
                        ),
                      ),
                      const Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style!,
                    onPressed: () => context.goNamed('signup'),
                    child: Text(
                      ScreenConstants.signInScreenConstants['signUpCta']!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
