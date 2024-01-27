import 'package:flutter/foundation.dart';
import 'package:food_delivery_flutter/feature/auth/domain/food_user.dart';

class ProfileViewModel extends ChangeNotifier {
  FoodUser foodUser = FoodUser.empty();
}
