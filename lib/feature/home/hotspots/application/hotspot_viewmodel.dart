import 'package:flutter/widgets.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_viewmodel.dart';

class HotspotViewModel extends ChangeNotifier {
  final HomeViewViewModel homeViewViewModel;
  HotspotViewModel({required this.homeViewViewModel}) {
    searchItems = homeViewViewModel.hotSpots;
  }

  late List<FoodModel> searchItems;

  void updateSearchItems(String foodName) {
    if (foodName.isEmpty) {
      searchItems = homeViewViewModel.hotSpots;
      notifyListeners();
      return;
    }

    searchItems = [];

    for (var element in homeViewViewModel.hotSpots) {
      if (element.name?.toLowerCase().startsWith(foodName.toLowerCase()) == true) {
        if (!searchItems.contains(element)) {
          searchItems.add(element);
        }
      }
    }

    notifyListeners();
  }
}
