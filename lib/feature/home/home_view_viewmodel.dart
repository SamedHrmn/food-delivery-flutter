import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

import 'domain/food_model.dart';

class HomeViewViewModel extends ChangeNotifier {
  int _pageIndex = 0;
  PageController? pageController;

  void updatePageIndex(int i) {
    _pageIndex = i;
    notifyListeners();
  }

  int get pageIndex => _pageIndex;

  final featuredItems = [
    FoodModel(
        name: 'McDonald’s(Best Offer)',
        specialText: "Free Item(Spend \$10)",
        deliveryFee: 4.99,
        price: 20,
        cal: 200,
        rating: 4.5,
        duration: "15-30",
        imagePath: Assets.images.imBurgerMealWithFrenchFries.path),
    FoodModel(
      name: 'Supreme Pizza',
      specialText: "Buy 1 Get 1 Free",
      deliveryFee: 2.99,
      price: 20,
      cal: 200,
      rating: 4.5,
      duration: "15-30",
      imagePath: Assets.images.imDeliciousPizzaIndoors.path,
    ),
  ];

  final _hotspotItems = [
    FoodModel(name: 'Mc Double', price: 20.99, cal: 250, rating: 4.5, duration: "50", imagePath: Assets.images.imHotspot1.path, extras: ["Ketchup", "Cheese"]),
    FoodModel(name: 'Supreme Pizza', price: 15.99, cal: 250, rating: 4.5, duration: "50", imagePath: Assets.images.imHotspot2.path),
    FoodModel(name: 'Chicken Wings', price: 25.99, cal: 250, rating: 4.5, duration: "50", imagePath: Assets.images.imHotspot3.path),
    FoodModel(name: 'Berry cake', price: 10.99, cal: 250, rating: 4.5, duration: "50", imagePath: Assets.images.imHotspot4.path),
  ];

  int updateHotspotItem(FoodModel model) {
    var m = getFoodModelInHotspots(model);
    if (m == null) return -1;

    _hotspotItems[_hotspotItems.indexOf(m)] = model;
    notifyListeners();
    return 0;
  }

  List<FoodModel> get hotSpots => _hotspotItems;

  FoodModel? getFoodModelInHotspots(FoodModel model) {
    try {
      return _hotspotItems.firstWhere((element) => element.name == model.name);
    } catch (e) {
      return null;
    }
  }
}
