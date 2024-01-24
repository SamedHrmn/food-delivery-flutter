import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/onboarding/presentation/onboard_view.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:gen/gen.dart';

mixin OnboardViewMixin on State<OnboardView> {
  final pageController = PageController();
  int pageViewIndex = 0;

  void updatePageViewIndex(int i) {
    setState(() {
      pageViewIndex = i;
    });
  }

  final splashContents = [
    OnboardContent(
      imPath: Assets.images.onboarding1.path,
      header: StringConstant.onboardHeader1,
      text: StringConstant.onboardContent1,
    ),
    OnboardContent(
      imPath: Assets.images.onboarding2.path,
      header: StringConstant.onboardHeader2,
      text: StringConstant.onboardContent2,
    ),
    OnboardContent(
      imPath: Assets.images.onboarding3.path,
      header: StringConstant.onboardHeader3,
      text: StringConstant.onboardContent3,
    ),
    OnboardContent(
      imPath: Assets.images.onboarding4.path,
      header: StringConstant.onboardHeader4,
      text: StringConstant.onboardContent4,
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
