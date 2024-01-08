import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

import 'domain/featured_model.dart';

class HomeViewViewModel extends ChangeNotifier {
  int _pageIndex = 0;
  PageController? pageController;

  void updatePageIndex(int i) {
    _pageIndex = i;
    notifyListeners();
  }

  int get pageIndex => _pageIndex;

  final featuredItems = [
    FeaturedModel(
        name: 'McDonald’s(Best Offer)',
        specialText: "Free Item(Spend \$10)",
        deliveryFee: 4.99,
        rating: 4.5,
        duration: "15-30",
        imagePath: Assets.images.imBurgerMealWithFrenchFries.path),
    FeaturedModel(
      name: 'Supreme Pizza',
      specialText: "Buy 1 Get 1 Free",
      deliveryFee: 2.99,
      rating: 4.5,
      duration: "15-30",
      imagePath: Assets.images.imDeliciousPizzaIndoors.path,
    ),
  ];
}
