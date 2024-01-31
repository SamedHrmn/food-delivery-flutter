import 'package:food_delivery_flutter/feature/shared/data/dio_client.dart';
import 'package:food_delivery_flutter/project/constant/api_constant.dart';

class FoodService implements IFoodService {
  final DioClient _dioClient;

  FoodService({required DioClient client}) : _dioClient = client;

  @override
  Future<List<dynamic>> fetchFeaturedFoods() async {
    try {
      final response = await _dioClient.fetch<List<dynamic>>(uri: Uri.parse(ApiConstant.FEATURED_FOOD_URL));
      return response.isNotEmpty ? response : [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<dynamic>> fetchHotspotFoods() async {
    try {
      final response = await _dioClient.fetch<List<dynamic>>(uri: Uri.parse(ApiConstant.HOTSPOT_FOOD_URL));
      return response.isNotEmpty ? response : [];
    } catch (e) {
      return [];
    }
  }
}

abstract class IFoodService {
  Future<List<dynamic>> fetchFeaturedFoods();
  Future<List<dynamic>> fetchHotspotFoods();
}
