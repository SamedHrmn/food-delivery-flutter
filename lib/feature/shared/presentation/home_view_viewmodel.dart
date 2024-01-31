// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/shared/data/api_response.dart';

import 'package:food_delivery_flutter/project/enum/navbar_pages.dart';
import 'package:food_delivery_flutter/project/usecase/get_featured_usecase.dart';
import 'package:food_delivery_flutter/project/usecase/get_hotspot_usecase.dart';

import '../domain/food_model.dart';

class HomeViewViewModel extends ChangeNotifier {
  int _pageIndex = 0;
  PageController? _pageController;
  final GetFeaturedUseCase getFeaturedUseCase;
  final GetHotspotUseCase getHotspotUseCase;

  HomeViewViewModel({
    required this.getFeaturedUseCase,
    required this.getHotspotUseCase,
  });

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

  ApiResponse<List<FoodModel>> featuredItemsResponse = ApiResponse.init();
  ApiResponse<List<FoodModel>> hotspotItemsResponse = ApiResponse.init();

  Future<void> getFeaturedItems() async {
    try {
      featuredItemsResponse = ApiResponse.loading();
      notifyListeners();
      final items = await getFeaturedUseCase(null);
      featuredItemsResponse = ApiResponse.completed(items);
    } catch (e) {
      featuredItemsResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  Future<void> getHotspotItems() async {
    try {
      hotspotItemsResponse = ApiResponse.loading();
      notifyListeners();
      final items = await getHotspotUseCase(null);
      hotspotItemsResponse = ApiResponse.completed(items);
    } catch (e) {
      hotspotItemsResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }
}
