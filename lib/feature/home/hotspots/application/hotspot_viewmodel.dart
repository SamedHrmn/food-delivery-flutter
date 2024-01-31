import 'package:flutter/widgets.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_viewmodel.dart';

class HotspotViewModel extends ChangeNotifier {
  final HomeViewViewModel homeViewViewModel;
  HotspotViewModel({required this.homeViewViewModel}) {
    hotSpots = homeViewViewModel.hotspotItemsResponse.data ?? [];
    searchItems = hotSpots;
  }

  late List<FoodModel> searchItems;
  late final List<FoodModel> hotSpots;

  void updateSearchItems(String foodName) {
    if (foodName.isEmpty) {
      searchItems = hotSpots;
      notifyListeners();
      return;
    }

    searchItems = [];

    for (var element in hotSpots) {
      if (element.name?.toLowerCase().startsWith(foodName.toLowerCase()) == true) {
        if (!searchItems.contains(element)) {
          searchItems.add(element);
        }
      }
    }

    notifyListeners();
  }
}
