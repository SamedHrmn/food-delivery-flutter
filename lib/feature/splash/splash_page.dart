import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/splash/splash_page_mixin.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashPageMixin {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: splashContents.length,
      itemBuilder: (context, index) => SplashContent(
        imPath: splashContents[index].imPath,
        header: splashContents[index].header,
        text: splashContents[index].text,
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
          const SizedBox(height: 168),
        ],
      ),
    );
  }
}
