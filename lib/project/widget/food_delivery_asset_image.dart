import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';

class FoodDeliveryAssetImage extends StatelessWidget {
  const FoodDeliveryAssetImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.color,
    this.errorBuilder,
    this.fit,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return BaseImage(
      name: assetPath,
      width: width != null ? SizeHelper.toWidth(width!) : null,
      height: height != null ? SizeHelper.toHeight(height!) : null,
      fit: fit,
      color: color,
      errorBuilder: errorBuilder ?? (p0, p1, p2) => const Placeholder(),
    );
  }
}
