import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/auth/application/signup_view_model.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/extension/string_extension.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text_field.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: topImage(),
                ),
                FoodDeliveryTextField(
                  hintText: StringConstant.emailHint,
                  controller: emailController,
                  validator: (p0) => p0?.isEmailValid(),
                ),
                SizedBox(height: SizeHelper.toHeight(24)),
                FoodDeliveryTextField(
                  hintText: StringConstant.passwordHint,
                  controller: passwordController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return StringConstant.passwordEmptyError;
                    } else if (p0 != confirmPasswordController.value.text) {
                      return StringConstant.passwordDoesNotMatchError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeHelper.toHeight(24)),
                FoodDeliveryTextField(
                  hintText: StringConstant.confirmPasswordHint,
                  controller: confirmPasswordController,
                  validator: (p0) {
                    if (passwordController.value.text.isEmpty) return null;

                    if (p0 == null || p0.isEmpty) {
                      return StringConstant.passwordEmptyError;
                    } else if (p0 != passwordController.value.text) {
                      return StringConstant.passwordDoesNotMatchError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeHelper.toHeight(32)),
                FoodDeliveryButton(
                  text: StringConstant.signup,
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      context.read<SignupViewModel>().createFoodUser(emailController.value.text);
                      context.go(AppNavigation.homePagePath);
                    }
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
                SizedBox(height: SizeHelper.toHeight(16)),
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
      ),
    );
  }

  Padding orBlock() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeHelper.toHeight(28)),
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
