import 'package:flutter/widgets.dart';
import 'package:food_delivery_flutter/feature/home/domain/food_model.dart';

class FoodDetailViewModel extends ChangeNotifier {
  Map<String, int>? selectedExtras;
  bool extasInitialized = false;

  void initExtasForSelectedFood(FoodModel foodModel) {
    selectedExtras = {};
    Map<String, int> dummy = {};
    extasInitialized = false;
    notifyListeners();
    for (var element in foodModel.extras) {
      dummy[element] = 1;
    }
    selectedExtras = dummy;
    extasInitialized = true;
    notifyListeners();
  }

  void increaseExtra(String extra) {
    selectedExtras?[extra] = (selectedExtras?[extra] ?? 0) + 1;
    notifyListeners();
  }

  void decreaseExtra(String extra) {
    if (selectedExtras?[extra] == 0) return;
    selectedExtras?[extra] = (selectedExtras?[extra] ?? 0) - 1;
    notifyListeners();
  }
}
