import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';
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
              SizedBox(height: SizeHelper.toHeight(28)),
              const FoodDeliveryTextField(hintText: StringConstant.passwordHint),
              SizedBox(height: SizeHelper.toHeight(28)),
              const FoodDeliveryTextField(hintText: StringConstant.confirmPasswordHint),
              SizedBox(height: SizeHelper.toHeight(28)),
              FoodDeliveryButton(
                text: StringConstant.signup,
                onPressed: () {
                  context.go(AppNavigation.homePagePath);
                },
              ),
              orBlock(),
              FoodDeliveryButton.icon(
                text: StringConstant.signupGoogle,
                iconPath: Assets.images.icGoogle.path,
                backgroundColor: FoodDeliveryColors.white1,
                hasBorder: true,
                onPressed: () {
                  context.go(AppNavigation.homePagePath);
                },
              ),
              SizedBox(height: SizeHelper.toHeight(21)),
              FoodDeliveryButton.icon(
                text: StringConstant.signupFacebook,
                iconPath: Assets.images.icFacebook.path,
                backgroundColor: FoodDeliveryColors.white1,
                hasBorder: true,
                onPressed: () {
                  context.go(AppNavigation.homePagePath);
                },
              ),
              SizedBox(height: SizeHelper.toHeight(32)),
              InkWell(
                onTap: () {
                  context.pushReplacement(AppNavigation.loginViewPath);
                },
                child: const TextFoodDelivery(
                  text: StringConstant.alreadyHaveAccount,
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

  Padding orBlock() {
    return Padding(
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
            text: StringConstant.or,
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
    );
  }

  Padding topImage() {
    return Padding(
      padding: EdgeInsets.only(top: SizeHelper.toHeight(62), bottom: SizeHelper.toHeight(47)),
      child: FoodDeliveryAssetImage(
        assetPath: Assets.images.imSplashIcon.path,
        width: 149,
        height: 110,
      ),
    );
  }
}
