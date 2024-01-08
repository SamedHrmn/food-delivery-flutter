import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class SizeHelper {
  const SizeHelper._();

  static double toWidth(double figmaWidth) {
    double deviceWidth = MediaQueryData.fromView(PlatformDispatcher.instance.views.first).size.width;
    return figmaWidth * (deviceWidth / 392.0);
  }

  static double toHeight(double figmaHeight) {
    double deviceHeight = MediaQueryData.fromView(PlatformDispatcher.instance.views.first).size.height;
    return figmaHeight * (deviceHeight / 852.0);
  }

  static EdgeInsets padding({double l = 0, double t = 0, double r = 0, double b = 0, double? all}) =>
      all == null ? EdgeInsets.only(left: toWidth(l), top: toHeight(t), right: toWidth(r), bottom: toHeight(b)) : EdgeInsets.all(SizeHelper.toHeight(all));
}
