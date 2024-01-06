import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/splash/splash_page_mixin.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:food_delivery_flutter/project/widget/splash_indicator.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: updatePageViewIndex,
              itemCount: splashContents.length,
              itemBuilder: (context, index) => SplashContent(
                imPath: splashContents[index].imPath,
                header: splashContents[index].header,
                text: splashContents[index].text,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 120, top: 48),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 100),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchOutCurve: Curves.easeOut,
                switchInCurve: Curves.easeIn,
                child: pageViewIndex != splashContents.length - 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < splashContents.length; i++) ...{
                            SplashIndicator(currentPageIndex: pageViewIndex, itemIndex: i),
                          }
                        ],
                      )
                    : FoodDeliveryButton(
                        text: 'Get Started',
                        onPressed: () => context.go(AppNavigation.authViewPath),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.imPath,
    required this.header,
    required this.text,
  });

  final String imPath;
  final String header;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imPath,
              package: 'gen',
            ),
          ),
          TextFoodDelivery(text: header, size: 26),
          const SizedBox(height: 24),
          TextFoodDelivery(
            text: text,
            size: 13,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
