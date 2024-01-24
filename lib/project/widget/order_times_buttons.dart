import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';

class OrderTimesButtons extends StatelessWidget {
  const OrderTimesButtons({super.key, required this.onDecrease, required this.onIncrease, required this.text, this.decreaseIcon});

  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final String text;
  final IconData? decreaseIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SizeHelper.padding(l: 6, r: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: FoodDeliveryColors.yellow1,
      ),
      child: Row(
        children: [
          FoodDeliveryIconButton(
            onTap: onDecrease,
            iconData: decreaseIcon ?? Icons.remove,
            size: 20,
            color: FoodDeliveryColors.yellow1,
          ),
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            alignment: Alignment.center,
            margin: SizeHelper.padding(l: 4, r: 4),
            padding: SizeHelper.padding(all: 6),
            child: TextFoodDelivery(
              text: text,
              size: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          FoodDeliveryIconButton(
            onTap: onIncrease,
            iconData: Icons.add,
            size: 20,
            color: FoodDeliveryColors.yellow1,
          ),
        ],
      ),
    );
  }
}
