import 'package:flutter/material.dart';

class BaseAssetImage extends StatelessWidget {
  const BaseAssetImage({
    super.key,
    required this.name,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.errorBuilder,
  });

  final String name;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      package: 'gen',
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: errorBuilder,
    );
  }
}
