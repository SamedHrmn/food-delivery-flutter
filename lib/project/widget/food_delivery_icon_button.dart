import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';

class FoodDeliveryIconButton extends StatelessWidget {
  const FoodDeliveryIconButton._({super.key, required this.onTap, this.iconPath, this.iconData, this.color, this.size, this.padding});

  final VoidCallback onTap;
  final String? iconPath;
  final IconData? iconData;
  final Color? color;
  final double? size;
  final double? padding;

  factory FoodDeliveryIconButton({
    Key? key,
    required VoidCallback onTap,
    required IconData iconData,
    Color? color,
    double? size,
    double? padding,
  }) {
    return FoodDeliveryIconButton._(
      onTap: onTap,
      iconData: iconData,
      color: color,
      size: size,
      padding: padding,
    );
  }

  factory FoodDeliveryIconButton.image({
    Key? key,
    required VoidCallback onTap,
    required String iconPath,
    Color? color,
    double? size,
    double? padding,
  }) {
    return FoodDeliveryIconButton._(
      onTap: onTap,
      iconPath: iconPath,
      color: color,
      size: size,
      padding: padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseIconButton(
      onTap: onTap,
      shape: const CircleBorder(),
      color: color,
      child: Padding(
        padding: SizeHelper.padding(all: padding ?? 4),
        child: iconData != null
            ? Icon(
                iconData!,
                size: SizeHelper.toHeight(size ?? 20),
              )
            : FoodDeliveryAssetImage(
                assetPath: iconPath ?? '',
                color: Colors.black,
                width: size ?? 20,
              ),
      ),
    );
  }
}
