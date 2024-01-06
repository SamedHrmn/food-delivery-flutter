import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import '../../project/widget/food_delivery_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go(AppNavigation.authViewPath);
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  Assets.images.imSplashIcon.path,
                  package: 'gen',
                  width: 180,
                  height: 140,
                ),
              ),
              const FoodDeliveryTextField(hintText: 'Email'),
              const SizedBox(height: 24),
              const FoodDeliveryTextField(hintText: 'Password'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextFoodDelivery(
                    text: 'Forget Password?',
                    size: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              FoodDeliveryButton(
                text: 'Login',
                onPressed: () {},
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.pushReplacement(AppNavigation.signupViewPath);
                },
                child: const TextFoodDelivery(
                  text: "Don't have an account? Sign up",
                  size: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
