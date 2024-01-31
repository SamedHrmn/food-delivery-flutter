import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_flutter/feature/shared/data/food_service.dart';
import 'package:food_delivery_flutter/project/di/locator.dart';

void main() {
  test('Dio api test', () async {
    setupDependencies();

    final foodService = getIt<FoodService>();
    final featured = await foodService.fetchFeaturedFoods();
    featured.forEach(print);
    final hotspots = await foodService.fetchHotspotFoods();
    hotspots.forEach(print);
  });
}
