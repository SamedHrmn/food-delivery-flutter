import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(height: 42),
            Expanded(
              child: Image.asset(
                Assets.images.imRegister.path,
                package: 'gen',
              ),
            ),
            const TextFoodDelivery(text: 'Welcome to Super Foodo', size: 24),
            const SizedBox(height: 12),
            const TextFoodDelivery(
              text: 'Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque',
              size: 13,
              fontWeight: FontWeight.w400,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 32),
            ),
            FoodDeliveryButton(
              text: 'Create Account',
              onPressed: () => context.push(AppNavigation.signupViewPath),
            ),
            const SizedBox(height: 12),
            FoodDeliveryButton(
              text: 'Login',
              onPressed: () => context.push(AppNavigation.loginViewPath),
              hasBorder: true,
              backgroundColor: FoodDeliveryColors.white1,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 42),
              child: TextFoodDelivery(
                text: 'By Registering or Login you have agreed to these Terms and Conditions.',
                size: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
