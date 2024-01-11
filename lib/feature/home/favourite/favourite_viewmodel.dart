import 'package:flutter/widgets.dart';
import 'package:food_delivery_flutter/feature/home/domain/food_model.dart';

class FavouriteViewModel extends ChangeNotifier {
  List<FoodModel> favouritesAll = [];
  bool favouritesAllLoading = false;

  void updateFoodFavorite(FoodModel? foodModel) {
    if (foodModel == null) return;

    final i = favouritesAll.indexWhere((element) => foodModel.name == element.name);
    if (i != -1) {
      favouritesAll.removeAt(i);
    } else {
      favouritesAll.add(foodModel);
    }

    notifyListeners();
  }

  bool isFavourite(FoodModel model) {
    return favouritesAll.contains(model);
  }
}
