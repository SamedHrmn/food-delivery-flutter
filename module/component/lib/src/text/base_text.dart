import 'package:flutter/widgets.dart';

class BaseText extends StatelessWidget {
  const BaseText({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.fontFamily,
    this.textOverflow,
    this.fontWeight,
    this.align,
  });

  final String text;
  final double? size;
  final Color? color;
  final String? fontFamily;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        overflow: textOverflow,
      ),
    );
  }
}

extension BaseTextStyle on BaseText {
  TextStyle get style => TextStyle(
        color: color,
        fontSize: size,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        overflow: textOverflow,
      );
}
