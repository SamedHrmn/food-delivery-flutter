/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/poppins_bold.ttf
  String get poppinsBold => 'assets/fonts/poppins_bold.ttf';

  /// File path: assets/fonts/poppins_extrabold.ttf
  String get poppinsExtrabold => 'assets/fonts/poppins_extrabold.ttf';

  /// File path: assets/fonts/poppins_extralight.ttf
  String get poppinsExtralight => 'assets/fonts/poppins_extralight.ttf';

  /// File path: assets/fonts/poppins_light.ttf
  String get poppinsLight => 'assets/fonts/poppins_light.ttf';

  /// File path: assets/fonts/poppins_medium.ttf
  String get poppinsMedium => 'assets/fonts/poppins_medium.ttf';

  /// File path: assets/fonts/poppins_semibold.ttf
  String get poppinsSemibold => 'assets/fonts/poppins_semibold.ttf';

  /// List of all assets
  List<String> get values => [
        poppinsBold,
        poppinsExtrabold,
        poppinsExtralight,
        poppinsLight,
        poppinsMedium,
        poppinsSemibold
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic _email_check.png
  AssetGenImage get icEmailCheck =>
      const AssetGenImage('assets/images/ic _email_check.png');

  /// File path: assets/images/ic _facebook.png
  AssetGenImage get icFacebook =>
      const AssetGenImage('assets/images/ic _facebook.png');

  /// File path: assets/images/ic _google.png
  AssetGenImage get icGoogle =>
      const AssetGenImage('assets/images/ic _google.png');

  /// File path: assets/images/ic _tick.png
  AssetGenImage get icTick => const AssetGenImage('assets/images/ic _tick.png');

  /// File path: assets/images/ic_burger.png
  AssetGenImage get icBurger =>
      const AssetGenImage('assets/images/ic_burger.png');

  /// File path: assets/images/ic_ice_cream.png
  AssetGenImage get icIceCream =>
      const AssetGenImage('assets/images/ic_ice_cream.png');

  /// File path: assets/images/ic_meat.png
  AssetGenImage get icMeat => const AssetGenImage('assets/images/ic_meat.png');

  /// File path: assets/images/ic_pizza.png
  AssetGenImage get icPizza =>
      const AssetGenImage('assets/images/ic_pizza.png');

  /// File path: assets/images/im_register.png
  AssetGenImage get imRegister =>
      const AssetGenImage('assets/images/im_register.png');

  /// File path: assets/images/im_splash_background.png
  AssetGenImage get imSplashBackground =>
      const AssetGenImage('assets/images/im_splash_background.png');

  /// File path: assets/images/im_splash_icon.png
  AssetGenImage get imSplashIcon =>
      const AssetGenImage('assets/images/im_splash_icon.png');

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// File path: assets/images/onboarding4.png
  AssetGenImage get onboarding4 =>
      const AssetGenImage('assets/images/onboarding4.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icEmailCheck,
        icFacebook,
        icGoogle,
        icTick,
        icBurger,
        icIceCream,
        icMeat,
        icPizza,
        imRegister,
        imSplashBackground,
        imSplashIcon,
        onboarding1,
        onboarding2,
        onboarding3,
        onboarding4
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
