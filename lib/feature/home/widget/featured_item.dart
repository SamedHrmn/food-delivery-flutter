import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';

import '../domain/featured_model.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, required this.featuredModel});

  final FeaturedModel featuredModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeHelper.toWidth(255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  featuredModel.imagePath ?? '',
                  package: 'gen',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  height: SizeHelper.toHeight(142),
                  errorBuilder: (context, error, stackTrace) => const Placeholder(),
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
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    Assets.images.icFav2.path,
                    package: 'gen',
                    color: FoodDeliveryColors.white1,
                    width: SizeHelper.toWidth(22),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeHelper.toHeight(10),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFoodDelivery(text: featuredModel.name ?? '', size: 16, fontWeight: FontWeight.w500),
                    Expanded(
                      child: TextFoodDelivery(
                        text: '\$${featuredModel.deliveryFee?.toString() ?? ''} Delivery Fee.${featuredModel.duration ?? ''} min',
                        size: 11,
                        fontWeight: FontWeight.w400,
                        color: FoodDeliveryColors.black1.withOpacity(0.6),
                      ),
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
            ),
          )
        ],
      ),
    );
  }
}
