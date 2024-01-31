import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_image.dart';
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
              child: FoodDeliveryImage(
                pathOrUrl: Assets.images.imRegister.path,
              ),
            ),
            const TextFoodDelivery(text: StringConstant.authHeader, size: 24),
            const SizedBox(height: 12),
            const TextFoodDelivery(
              text: StringConstant.authContent,
              size: 13,
              fontWeight: FontWeight.w400,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 32),
            ),
            FoodDeliveryButton(
              text: StringConstant.createAccount,
              onPressed: () => context.push(AppNavigation.signupViewPath),
            ),
            const SizedBox(height: 12),
            FoodDeliveryButton(
              text: StringConstant.login,
              onPressed: () => context.push(AppNavigation.loginViewPath),
              hasBorder: true,
              backgroundColor: FoodDeliveryColors.white1,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 42),
              child: TextFoodDelivery(
                text: StringConstant.authTermsOfCondition,
                size: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
