import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/enum/food_category.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.foodCategory});

  final FoodCategory foodCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeHelper.toWidth(80),
          height: SizeHelper.toHeight(65),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: FoodDeliveryColors.white1, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
            ),
          ]),
          child: FoodDeliveryAssetImage(
            assetPath: foodCategory.iconPath(),
            width: 32,
            height: 32,
          ),
        ),
        SizedBox(
          height: SizeHelper.toHeight(8),
        ),
        Expanded(
          child: TextFoodDelivery(text: foodCategory.text(), size: 15, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
