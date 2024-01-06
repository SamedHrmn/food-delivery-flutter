import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text_field.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                child: Padding(
                  padding: EdgeInsets.only(top: SizeHelper.toHeight(62), bottom: SizeHelper.toHeight(47)),
                  child: Image.asset(
                    Assets.images.imSplashIcon.path,
                    package: 'gen',
                    width: SizeHelper.toWidth(149),
                    height: SizeHelper.toHeight(110),
                  ),
                ),
              ),
              const FoodDeliveryTextField(hintText: 'Email'),
              SizedBox(height: SizeHelper.toHeight(28)),
              const FoodDeliveryTextField(hintText: 'Password'),
              SizedBox(height: SizeHelper.toHeight(28)),
              const FoodDeliveryTextField(hintText: 'Confirm password'),
              SizedBox(height: SizeHelper.toHeight(28)),
              FoodDeliveryButton(
                text: 'Sign up',
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: SizeHelper.toHeight(32)),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        margin: const EdgeInsets.only(left: 32, right: 16),
                        color: Colors.black,
                        width: double.maxFinite,
                      ),
                    ),
                    const TextFoodDelivery(
                      text: "OR",
                      size: 15,
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        margin: const EdgeInsets.only(right: 32, left: 16),
                        color: Colors.black,
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                ),
              ),
              FoodDeliveryButton.icon(
                text: 'Sign Up with Google',
                iconPath: Assets.images.icGoogle.path,
                backgroundColor: FoodDeliveryColors.white1,
                hasBorder: true,
                onPressed: () {},
              ),
              SizedBox(height: SizeHelper.toHeight(21)),
              FoodDeliveryButton.icon(
                text: 'Sign Up with Facebook',
                iconPath: Assets.images.icFacebook.path,
                backgroundColor: FoodDeliveryColors.white1,
                hasBorder: true,
                onPressed: () {},
              ),
              SizedBox(height: SizeHelper.toHeight(32)),
              InkWell(
                onTap: () {
                  context.pushReplacement(AppNavigation.loginViewPath);
                },
                child: const TextFoodDelivery(
                  text: "Already have an account? Log in",
                  size: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: SizeHelper.toHeight(54)),
            ],
          ),
        ),
      ),
    );
  }
}
