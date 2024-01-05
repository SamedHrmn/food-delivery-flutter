import 'package:component/component.dart';
import 'package:flutter/widgets.dart';
import 'package:gen/gen.dart';

class TextFoodDelivery extends StatelessWidget {
  const TextFoodDelivery({
    super.key,
    required this.text,
    required this.size,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.center,
  });

  final String text;
  final double size;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      size: size,
      fontFamily: FontFamily.poppins,
      color: FoodDeliveryColors.black1,
      fontWeight: fontWeight,
      align: textAlign,
    );
  }
}
