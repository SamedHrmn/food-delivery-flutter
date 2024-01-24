import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/enum/navbar_pages.dart';
import 'package:gen/gen.dart';

import '../domain/food_model.dart';

class HomeViewViewModel extends ChangeNotifier {
  int _pageIndex = 0;
  PageController? _pageController;

  void updatePageIndex(int i) {
    _pageIndex = i;
    notifyListeners();
  }

  void initializePageController(PageController controller) {
    _pageController = controller;
  }

  void toNavbarPage(NavbarPages page) {
    _pageController?.jumpToPage(page.index);
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

  List<FoodModel> get hotSpots => _hotspotItems;

  List<FoodModel> get foodAll => _hotspotItems + featuredItems;
}
