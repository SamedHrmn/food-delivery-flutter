import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';

class HotspotItem extends StatelessWidget {
  const HotspotItem({super.key, required this.hotspotModel, this.onTap, this.child});

  final FoodModel hotspotModel;
  final VoidCallback? onTap;
  final Widget? child;

  factory HotspotItem.loading() => HotspotItem(
        hotspotModel: FoodModel.empty(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: SizeHelper.toWidth(140),
            height: SizeHelper.toHeight(133),
            child: const ColoredBox(color: Colors.white),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child ??
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: SizeHelper.toHeight(133),
                  decoration: BoxDecoration(
                    color: FoodDeliveryColors.white1,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: SizeHelper.padding(b: 13),
                child: Column(
                  children: [
                    Expanded(
                      child: FoodDeliveryImage(
                        pathOrUrl: hotspotModel.imagePath ?? '',
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: SizeHelper.padding(t: 10, b: 10),
                      child: TextFoodDelivery(
                        text: hotspotModel.name ?? '-',
                        size: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFoodDelivery(
                      text: '\$${hotspotModel.price?.toString() ?? '-'}',
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
