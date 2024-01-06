import 'package:food_delivery_flutter/feature/auth/auth_view.dart';
import 'package:food_delivery_flutter/feature/auth/login_view.dart';
import 'package:food_delivery_flutter/feature/auth/signup_view.dart';
import 'package:food_delivery_flutter/feature/home/home_view.dart';
import 'package:food_delivery_flutter/feature/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final class AppNavigation {
  const AppNavigation._();

  static const splashPagePath = '/';
  static const homePagePath = '/home';
  static const authViewPath = '/auth';
  static const loginViewPath = '/auth/login';
  static const signupViewPath = '/auth/signup';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashPagePath,
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: authViewPath,
        builder: (context, state) {
          return const AuthView();
        },
      ),
      GoRoute(
        path: signupViewPath,
        builder: (context, state) {
          return const SignupView();
        },
      ),
      GoRoute(
        path: loginViewPath,
        builder: (context, state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: homePagePath,
        builder: (context, state) {
          return const HomeView();
        },
      )
    ],
  );
}
