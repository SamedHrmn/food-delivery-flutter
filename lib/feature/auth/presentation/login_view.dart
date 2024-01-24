import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import '../../../project/widget/food_delivery_text_field.dart';

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
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: topImage(),
              ),
              const FoodDeliveryTextField(hintText: StringConstant.emailHint),
              const SizedBox(height: 24),
              const FoodDeliveryTextField(hintText: StringConstant.passwordHint),
              forgetPassword(),
              FoodDeliveryButton(
                text: StringConstant.login,
                onPressed: () {
                  context.go(AppNavigation.homePagePath);
                },
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.pushReplacement(AppNavigation.signupViewPath);
                },
                child: const TextFoodDelivery(
                  text: StringConstant.dontHaveAccount,
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

  Padding forgetPassword() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextFoodDelivery(
          text: StringConstant.forgetPassword,
          size: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  FoodDeliveryAssetImage topImage() {
    return FoodDeliveryAssetImage(
      assetPath: Assets.images.imSplashIcon.path,
      width: 180,
      height: 140,
    );
  }
}
