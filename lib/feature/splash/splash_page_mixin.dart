import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/splash/splash_page.dart';
import 'package:gen/gen.dart';

mixin SplashPageMixin on State<SplashPage> {
  final pageController = PageController();
  int pageViewIndex = 0;

  void updatePageViewIndex(int i) {
    setState(() {
      pageViewIndex = i;
    });
  }

  final splashContents = [
    SplashContent(
      imPath: Assets.images.onboarding1.path,
      header: 'Trending Foods',
      text: 'Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque diam mauris laoreet donec a eget aliquam.',
    ),
    SplashContent(
      imPath: Assets.images.onboarding2.path,
      header: 'Fast Delivery',
      text: 'Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque diam mauris laoreet donec a eget aliquam.',
    ),
    SplashContent(
      imPath: Assets.images.onboarding3.path,
      header: 'Find Nearby Restaurants',
      text: 'Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque diam mauris laoreet donec a eget aliquam.',
    ),
    SplashContent(
      imPath: Assets.images.onboarding4.path,
      header: 'Easy Ordering',
      text: 'Lorem ipsum dolor sit amet consectetur. Ut cras pellentesque diam mauris laoreet donec a eget aliquam.',
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
