import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:shimmer/shimmer.dart';

class FoodShimmerLoader extends StatelessWidget {
  const FoodShimmerLoader({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: FoodDeliveryColors.yellow2,
      child: child,
    );
  }
}
