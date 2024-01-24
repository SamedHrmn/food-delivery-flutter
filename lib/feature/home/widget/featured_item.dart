import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_favourite_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';

import '../../shared/domain/food_model.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, required this.featuredModel, required this.onTap});

  final FoodModel featuredModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: SizeHelper.toWidth(255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FoodDeliveryAssetImage(
                      assetPath: featuredModel.imagePath ?? '',
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (featuredModel.specialText != null) ...{
                    Container(
                      margin: SizeHelper.padding(t: 18),
                      padding: SizeHelper.padding(l: 8, r: 8),
                      decoration: const BoxDecoration(
                        color: FoodDeliveryColors.yellow1,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: TextFoodDelivery(
                        text: featuredModel.specialText!,
                        size: 11,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  },
                  Positioned(
                    right: SizeHelper.toWidth(10),
                    top: SizeHelper.toHeight(10),
                    child: FoodDeliveryFavouriteButton(model: featuredModel),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeHelper.toHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFoodDelivery(text: featuredModel.name ?? '', size: 16, fontWeight: FontWeight.w500),
                    TextFoodDelivery(
                      text: '\$${featuredModel.deliveryFee?.toString() ?? ''} ${StringConstant.deliveryFee}.${featuredModel.duration ?? ''} ${StringConstant.min}',
                      size: 11,
                      fontWeight: FontWeight.w400,
                      color: FoodDeliveryColors.black1.withOpacity(0.6),
                    ),
                  ],
                ),
                Container(
                  width: SizeHelper.toWidth(32),
                  height: SizeHelper.toHeight(27),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: FoodDeliveryColors.gray4),
                  alignment: Alignment.center,
                  child: TextFoodDelivery(
                    text: featuredModel.rating?.toString() ?? '',
                    size: 11,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
