import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@immutable
final class SplashScreenHelper {
  static void initSplash({required WidgetsBinding binding}) {
    FlutterNativeSplash.preserve(widgetsBinding: binding);
  }

  static void removeSplash() {
    FlutterNativeSplash.remove();
  }
}
