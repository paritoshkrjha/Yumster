import 'package:go_router/go_router.dart';
import 'package:yumster/core/common/loading_page.dart';
import 'package:yumster/core/utils.dart';
import 'package:yumster/features/auth/screens/get_started.dart';
import 'package:yumster/features/auth/screens/login.dart';
import 'package:yumster/features/auth/screens/sign_up/sign_up.dart';
import 'package:yumster/features/home/screens/home.dart';
import 'package:yumster/features/splashLoader/screens/splash_loader_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splashloaderscreen(),
    ),
    GoRoute(
      name: 'getStarted',
      path: '/get-started',
      builder: (context, state) => const GetStartedScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'signup',
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: 'loading',
      path: '/loading/:isLogin',
      builder: (context, state) => CustomLoadingPage(
        isLogin: state.pathParameters['isLogin']! == 'true',
      ),
    ),
    GoRoute(
      name: 'alertDialog',
      path: '/alert-dialog/:title/:content',
      pageBuilder: (context, state) {
        return Utils().showAlertDialog(
          context,
          state.pathParameters['title']!,
          state.pathParameters['content']!,
        );
      },
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
