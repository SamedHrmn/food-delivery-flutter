import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class SplashIndicator extends StatelessWidget {
  const SplashIndicator({super.key, required this.itemIndex, required this.currentPageIndex});

  final int itemIndex;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(right: 4),
      decoration: ShapeDecoration(
        shape: const CircleBorder(),
        color: currentPageIndex == itemIndex ? FoodDeliveryColors.yellow1 : FoodDeliveryColors.yellow2,
      ),
    );
  }
}
