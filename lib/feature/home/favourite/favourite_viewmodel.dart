import 'package:flutter/widgets.dart';
import 'package:food_delivery_flutter/feature/home/domain/food_model.dart';
import 'package:food_delivery_flutter/feature/home/home_view_viewmodel.dart';

class FavouriteViewModel extends ChangeNotifier {
  final HomeViewViewModel _homeViewViewModel;

  FavouriteViewModel({required HomeViewViewModel homeViewViewModel}) : _homeViewViewModel = homeViewViewModel;

  void updateFoodFavorite(FoodModel? foodModel) {
    if (foodModel == null) return;

    _homeViewViewModel.updateHotspotItem(foodModel.copyWith(isFavourite: !foodModel.isFavourite));
  }
}
