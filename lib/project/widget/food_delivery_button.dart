import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';

class FoodDeliveryButton extends StatelessWidget {
  const FoodDeliveryButton._({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding,
    this.backgroundColor,
    this.hasBorder = false,
    this.iconPath,
  }) : super(key: key);

  factory FoodDeliveryButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool hasBorder = false,
  }) {
    return FoodDeliveryButton._(
      key: key,
      text: text,
      onPressed: onPressed,
      padding: padding,
      backgroundColor: backgroundColor,
      hasBorder: hasBorder,
    );
  }

  factory FoodDeliveryButton.icon({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool hasBorder = false,
    required String iconPath,
  }) {
    return FoodDeliveryButton._(
      key: key,
      text: text,
      onPressed: onPressed,
      padding: padding,
      backgroundColor: backgroundColor,
      hasBorder: hasBorder,
      iconPath: iconPath,
    );
  }

  final String text;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool hasBorder;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? FoodDeliveryColors.yellow1,
          minimumSize: Size.fromHeight(SizeHelper.toHeight(55)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: hasBorder ? const BorderSide(color: Colors.black) : BorderSide.none,
          ),
        ),
        child: iconPath == null
            ? TextFoodDelivery(text: text, size: 17)
            : Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(right: SizeHelper.toWidth(24), left: SizeHelper.toWidth(66)),
                      child: FoodDeliveryAssetImage(
                        assetPath: iconPath!,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  TextFoodDelivery(
                    text: text,
                    size: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
      ),
    );
  }
}
