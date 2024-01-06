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
}
