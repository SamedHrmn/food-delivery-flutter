import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';

class FoodDeliveryButton extends StatelessWidget {
  const FoodDeliveryButton({super.key, required this.text, required this.onPressed, this.padding});

  final String text;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: FoodDeliveryColors.yellow1,
          minimumSize: const Size.fromHeight(55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: TextFoodDelivery(text: text, size: 17),
      ),
    );
  }
}
