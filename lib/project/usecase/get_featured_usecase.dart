import 'dart:developer';

import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_repository.dart';
import 'package:food_delivery_flutter/project/usecase/use_case.dart';

final class GetFeaturedUseCase implements UseCase<List<FoodModel>, void> {
  final FoodRepository _foodRepository;

  GetFeaturedUseCase({required FoodRepository foodRepository}) : _foodRepository = foodRepository;

  @override
  Future<List<FoodModel>> call(void params) {
    try {
      return _foodRepository.fetchFeaturedFoods();
    } catch (e) {
      log('Error $e');
      return Future.value([]);
    }
  }
}
