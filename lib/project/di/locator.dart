import 'package:food_delivery_flutter/feature/shared/data/dio_client.dart';
import 'package:food_delivery_flutter/feature/shared/data/food_service.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_repository.dart';
import 'package:food_delivery_flutter/project/usecase/get_featured_usecase.dart';
import 'package:food_delivery_flutter/project/usecase/get_hotspot_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<FoodService>(() => FoodService(client: getIt<DioClient>()));
  getIt.registerLazySingleton<FoodRepository>(() => FoodRepository(foodService: getIt<FoodService>()));
  getIt.registerLazySingleton<GetFeaturedUseCase>(() => GetFeaturedUseCase(foodRepository: getIt<FoodRepository>()));
  getIt.registerLazySingleton<GetHotspotUseCase>(() => GetHotspotUseCase(foodRepository: getIt<FoodRepository>()));
}
