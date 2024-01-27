import 'package:flutter/foundation.dart';
import 'package:food_delivery_flutter/feature/home/profile/application/profile_view_model.dart';

class SignupViewModel extends ChangeNotifier {
  final ProfileViewModel profileViewModel;

  SignupViewModel({required this.profileViewModel});

  void createFoodUser(String email) {
    profileViewModel.foodUser = profileViewModel.foodUser.copyWith(email: email);
  }
}
