import 'package:food_delivery_flutter/feature/shared/data/food_service.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/project/constant/api_constant.dart';

class FoodRepository {
  final IFoodService _foodService;

  FoodRepository({required IFoodService foodService}) : _foodService = foodService;

  Future<List<FoodModel>> fetchFeaturedFoods() async {
    final response = await _foodService.fetchFeaturedFoods();
    final items = <FoodModel>[];

    for (var element in response) {
      var item = FoodModel.fromMap(element);
      item = item.copyWith(imagePath: ApiConstant.BASE_URL + (item.imagePath ?? ''));
      items.add(item);
    }

    return items;
  }

  Future<List<FoodModel>> fetchHotspotFoods() async {
    final response = await _foodService.fetchHotspotFoods();

    final items = <FoodModel>[];

    for (var element in response) {
      var item = FoodModel.fromMap(element);
      item = item.copyWith(imagePath: ApiConstant.BASE_URL + (item.imagePath ?? ''));
      items.add(item);
    }

    return items;
  }
}
