import 'package:food_delivery_flutter/feature/auth/presentation/auth_view.dart';
import 'package:food_delivery_flutter/feature/auth/presentation/login_view.dart';
import 'package:food_delivery_flutter/feature/auth/presentation/signup_view.dart';
import 'package:food_delivery_flutter/feature/detail/presentation/food_detail_view.dart';
import 'package:food_delivery_flutter/feature/home/cart/presentation/cart_view.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/feature/home/featured/presentation/featured_view.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view.dart';
import 'package:food_delivery_flutter/feature/onboarding/presentation/onboard_view.dart';
import 'package:go_router/go_router.dart';

final class AppNavigation {
  const AppNavigation._();

  static const splashPagePath = '/';
  static const homePagePath = '/home';
  static const authViewPath = '/auth';
  static const loginViewPath = '/auth/login';
  static const signupViewPath = '/auth/signup';
  static const featuredViewPath = '/home/featured';
  static const foodDetailViewPath = '/detail';
  static const cartViewPath = '/cart';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashPagePath,
        builder: (context, state) {
          return const OnboardView();
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
      ),
      GoRoute(
        path: featuredViewPath,
        builder: (context, state) {
          return const FeaturedView();
        },
      ),
      GoRoute(
        path: foodDetailViewPath,
        builder: (context, state) {
          return FoodDetailView(foodModel: state.extra as FoodModel);
        },
      ),
      GoRoute(
        path: cartViewPath,
        builder: (context, state) {
          return CartView(
            foodModel: state.extra as FoodModel,
          );
        },
      ),
    ],
  );
}
